Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E7606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j9mnRlRK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NSFWTKFb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hLE7zIODsl5Dn1F3z+eZFGB0/u3q24th+XRZBDiUu3w=; b=j9mnRlRKJQhdMG
	HrFovLTPDeBORWdB3t5oqznkmBYQFGC2ExSg2Md/hruvtWQTfiuiE438f45Z/Ys3JPfniqen2W/z1
	hQ6NrDMkQhguMjd7hKTcf7CXCXQwwOm6TLZrBUdsgstU31jFQ2tsjD3f9/S0ujh/4yqqUOMljqBEe
	VqZ/C3yVZCqCwkY5MbH8xv0Aw1ba9Y+mr6EOSDKRMFoK86qBmYwCAlVdVl3/Gi7zAZUJ1nllVc3FP
	VpgWcJXTneUmK/lDLnRsk7eoDofeJ0gsuHCgSG9JXHZdnKgd7AVsZGgZPFZV6Aj46wpeg6qtPF16s
	L99FEOvwtXxmya8L3Oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQNy-00000000wft-3EGD;
	Mon, 09 Nov 2026 14:30:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQNx-00000000wfj-0wdz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:30:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A12B54130E;
	Mon,  9 Nov 2026 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08601F0089F;
	Mon,  9 Nov 2026 14:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234612;
	bh=hLE7zIODsl5Dn1F3z+eZFGB0/u3q24th+XRZBDiUu3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NSFWTKFbtkVnPZgIm7p1bxRv3wCfECzuvW31hmUQz1bVcZmeUdBAy/6SveeDBQ393
	 QvtccfH5T4gSYdYqZGQ2iLSLE0ic1blqo4ypapFPKVuOZs+EYeeVHsoF3gbo03ML7Z
	 1XzAg6es7+xTcUvthSmbIEMM9xjmrrgNr1NJnSLbmBJsCpMwl797BGEl0nYSKFTGhp
	 HsbrLHNGrYLG1KU5ppvJD1YxJvdJXwMHUryFzsGZs/AgkUIDZhQttH7FzfJxWg7b8r
	 dfwy5Lw8P034O1ImZ710nKZZ0wxsGjECvSIogKSMVTENhwzD33joPr4bVMh8MIZda3
	 E7dvJ/K2q+ngg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, peter.griffin@linaro.org, linusw@kernel.org, 
 Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 morbo@google.com, kees@kernel.org, justinstitt@google.com, 
 aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
In-Reply-To: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank
 names
Message-Id: <179423460743.181703.6000020720951856731.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:30:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 27 Sep 2026 12:07:58 -0700, Mariia Nikitash wrote:
> samsung_banks_node_get() constructs each pin bank node name by copying
> bank->name with strscpy() and appending the suffix with strlcat().
> 
> In preparation for removing the deprecated strlcat() API[1], format the
> node name in a single snprintf() call, which preserves the existing
> truncation check against sizeof(node_name).
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Use snprintf() to construct pin bank names
      https://git.kernel.org/pinctrl/samsung/c/a47853cef90c0553457e690df693a6cc806a3849

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


