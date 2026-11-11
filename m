Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E18A606A896
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mBr2sf2L;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJVyBSlw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uH/TcuxN1DkH/KAf2C/W26e1z2CE8UYhXOwejDcIfK8=; b=mBr2sf2LwMeRi15R+FY2cVJrnI
	Xk1Gb6zq8ZPdK9Psg8lzZP+GUDzMZnMGysgWSXyUpabZtiGyHakI3P+kL91UnSSB97eOW+95e3uRq
	ykImVujykkB5Zi6RA7czoZtbzZ2kWTcSqbddvd5P+dd6sDICxYtNTqKun18TMvwPtG2avLCvVU76g
	r6M8IAt2GJZz9F0lXaIUR/R7A3v/FXgBDapcv7DnZ2fRZqBi8GSI5hj98DruP5iprjP5t1JmNwlqf
	fW5rBL37NF1QYBBZR5YdDNtYy7kkYexLLkLwJyL6zTsO+w5RTcSAaa23TgVsZcA74HGMukaSX5Vo3
	vu6ioo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7wR-00000006kpZ-212f;
	Wed, 11 Nov 2026 13:00:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7wO-00000006koP-2m9N;
	Wed, 11 Nov 2026 13:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22DCC40B24;
	Wed, 11 Nov 2026 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9461F00A05;
	Wed, 11 Nov 2026 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402040;
	bh=uH/TcuxN1DkH/KAf2C/W26e1z2CE8UYhXOwejDcIfK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cJVyBSlwdlOQ1r4Ldh5sNFFOjSmbNxhb9JpdmVse/biFBpvMMCR4al9NvyfbwxW7g
	 rlXPb8LhixKHvYy9dERoE+Z74pgJPNz+XHPtwzwBsjZYo4OmSwOJv0+FnA7ILpD0gd
	 MjMPwjdbEzaE0ah/+u+5HIApWv/kFeuCS7/GM3s0kt/WxpXv8Uld5JjlrHRaLHHXPv
	 eufmxx/1foqgMPMzDDVbTUCZr0n2sDIsqvS1uJjQnfy3Zipnu+iG7uTymSzDuH7frg
	 /Iol41yGDLbkwB4DlJ5SW/fpVJawMxUV54FyAyV1ato4rIa40yuz4Mk/W0jkei7W0/
	 3CFZEzOo0D71A==
Date: Wed, 11 Nov 2026 14:00:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rui Cao <i@udp0.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: watchdog: mediatek,mtk-wdt: Add MT6833
Message-ID: <20261111-dexterous-fennec-of-leadership-c69fa0@quoll>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com>
 <20261107-mt6833-base-v1-2-bda21083e9f3@udp0.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107-mt6833-base-v1-2-bda21083e9f3@udp0.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 08:21:59PM +0800, Rui Cao wrote:
> Add MediaTek's MT6833 (Dimensity 700). Its watchdog works as MT6589's,
> which it falls back to.
> 
> Signed-off-by: Rui Cao <i@udp0.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


