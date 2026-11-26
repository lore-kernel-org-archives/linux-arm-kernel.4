Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD503606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PO5oB9lu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JW1+LmUQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=otbopiCr4qtLePEipcetnofmMCVtZqbLSXMljjLeoEQ=; b=PO5oB9luYwav8j
	5TiTTi80g3AWO6PL501FwgMvqJeTSGML5Q3CsQliXEuI2bq21d67EKT5/jAuxxggJ+IQWz7lmKvwV
	slgH6nNB/fy+GXwfWLWjRMRoyF9RnlcdvpcfeuvcjGo2RN4/8wize2PY9NfuDXQVjo4NVu2wCfklQ
	cJScEvnZwFBC5+pFakm3DvHtU3vwmR0C5QmcoRPGXpG2o6LV96Xzi430+PAWEF0AhwYifvWyBbufD
	6GZsNOj/+QwPemTHwmreZ+4cG4pAg2TibxLgfi+58AL8VRI0wsFxlrQ377PfL2mPyyQy04xiHavrK
	CzYmOGK0mhgC0G6dY66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTmu-0000000CHU4-0WBX;
	Thu, 26 Nov 2026 07:21:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTmt-0000000CHTs-1o5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:20:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DCDF6266B;
	Thu, 26 Nov 2026 07:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8214A1F000C6;
	Thu, 26 Nov 2026 07:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795677658;
	bh=otbopiCr4qtLePEipcetnofmMCVtZqbLSXMljjLeoEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JW1+LmUQK3T9t2d8SScGessnBZIpyrCoGeATnPDOs1ObkEexj2jd5OI5WdQ7D4Eki
	 MZIaywD2gchjFH52/aFZLM8i1m+6vEDlOu1Cn+CptsiTMR8+S+jCeyR3edlvfvHM1V
	 XKxo6cJoYLYd2WUxWu6np/8DOqRo6tsblt9y22c5rclf5lcTT6uM/WA8hzT9xNZdt9
	 Z0KXBefr7AO+cNCWvLfRO4XcT0KH+zkP2IEhsZX4OyY3yn+ibwAR77YhNWnRCHQr6c
	 nElmHgWFBjDuat8P7uRHDXqezjvb8M3/ZRfv73IIXXlgQyJg45imlT/JhvkuJxL4P/
	 tWflmsul0DKZw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: tudor.ambarus@linaro.org, peter.griffin@linaro.org, 
 Suyuan Wang <shyckless@gmail.com>
Cc: alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
References: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
Subject: Re: [PATCH] firmware: samsung: acpm: Don't use pdev after putting
 it in acpm_get_by_node()
Message-Id: <179567765269.9086.11795383324223700321.b4-ty@b4>
Date: Thu, 26 Nov 2026 08:20:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
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


On Mon, 23 Nov 2026 00:46:28 +0000, Suyuan Wang wrote:
> firmware: samsung: acpm: Don't use pdev after putting it in acpm_get_by_node()

Applied, thanks!

[1/1] firmware: samsung: acpm: Don't use pdev after putting it in acpm_get_by_node()
      https://git.kernel.org/krzk/linux/c/45c8e9469b692b45920d2a238003a5f8362b05ac

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


