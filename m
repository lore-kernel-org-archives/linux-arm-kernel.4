Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04164606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1h3Tzedj;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N3epthB4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=; b=1h3TzedjqfFJ8yVU5EhVnSjP/I
	vaD4DmxmOAHaK72eDLgr/UQQBayWhhhxiBtWEb4DWEiIqgA02Jz0qlKXvcRjNwW2lTp5A5XIoFZGh
	dhr4A11XJgARm3ioDF+9dFt59Nx3b7SJQ25Q6O/fwv3/nc770E4ylJcOM73TPkZbvxWGej+fQai7W
	eX9X/xjGnjUnvPQHczeuFdk0pzOm2gcslqCPEw4OEZuZ4UQGcSPlTDBw18FqOWtplV16TZly8rumF
	13rSoSxTMZodDIXT88ysIYv/UMpvpCeq6x9CLi5xfsU17hriPu1HNzPxTlu+BJvwa9PJd7K2/9Q5X
	3mYb93vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL4r-0000000087Z-0IhR;
	Mon, 09 Nov 2026 08:50:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL4j-000000007u3-0jvp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:50:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-491971ac844so558219f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794214198; x=1794818998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=N3epthB4vcAG2wGnNyNEQyo05Xhc4bcNm+WH2ZXEmmSPr43TTwCzowbKG8VGpR2xEu
         4dezzfzIayNcFokrfWbHpSB+L6rsCIM7ATKhTw6/cipZATcNh0YNonqeKCEg4nM5C7Go
         JZ0+K8jlhqXs8ylK0OG1/xuTPaWI1PE37aktIPR3oCUMfVxeFd6QDBCLu5T6PiPtmncK
         Fiti9Ks4OookxoFQxnYjVGAqtnSFOzXqADM2LfepO1F2XwbF/AOok+gpofqGK4kIE5Dy
         zUHmPCW32X7m7lzDEf9FNDqdNJN7viKvPyKBu8CkoV5DD+9m1ekOwmtJHJHksAOvDBwN
         9UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214198; x=1794818998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=OVQk5jmGh6YLFYUAtltr7GClNZmRLqxH1zDkKjBllrpp6IewtyB9HG2DTeg58DqYXQ
         c2clFUVDwtRFhzgzOaqGd7By1FP1c02iXX96Gb6AgLfdWBKOpNfvgUvTiF9rEzpj2+Kl
         0okdkA1LBD08Cn+QDlSk5g4y/+FeCAJm32VFN6yykpVLZlVIT7IiSxS/ZJ2Xk3bDeqB5
         ImADIMHKJl7qJKHnCEXuoo2ojbmkD72kHeZfnfRf7JRrJxHBBH7Lq2OiDYSV9iqVpyNJ
         bFRPrhGbTBfrQDiEw3bMY+K59YQCEI7VmaoN3cxFTAUq6N11ta5R/vGF99sBe7JaWQKw
         9C/Q==
X-Forwarded-Encrypted: i=1; AL+hErE/BeGV4m+yQLLwMHyeRd+gGjpl/4gZkCSlKXAyekyxHsOz+h4WMtQVT+vqLSAmLZMJh/1YdwpJFWKXKgaKrqXA@lists.infradead.org
X-Gm-Message-State: APuU4Z9vROvoH9okSy30OVkQEl4pd1s2oBrAqpUq//LCu4P7K+8m4nZI
	kE9Zo1ERqx5J5m2pWvDZTiDX0zUraHkkKqdvpwFUtDAtYcu5vWyD13JuI5AKfZuL/u0=
X-Gm-Gg: AYBFou1IsXosFXC6BrrzIhc+8xn6V2ddC78fJLD/PgfKaC2Xr380kxPiHfpPOHFo1yZ
	ANj98m+v5GoX0/vWOgy0Y/lOqD2ZQdPlqBijeR5OxgEdNCY12TfDtRezVZ+wp9aCMF7BWw5SK2G
	pLezgdXZ2i660GSfStEEDFb6rJGng0l3ju29ytEEZ7wAo9K6mQ/G2xmLKifElovQhoxHu1aHpJn
	1qoaLZ7xitrbbX0qhAnMUi2M0hQjCgE8ZMrhNBeAyM8MrO/yjnSMLqezv5BVkmatLGGUmb9S8tK
	o6YVWPNUV+vl9gY+SK8UG14nJw8ky0HV+bj1Jj75VJ8p+snop0vk8Z42h6QeaImNmpKkbZdQ7Ct
	FNd85JTYk5Vw9SjEqZ8RFY9QlyHENh4+4I49bKluwv4NSz0WFMq8NEu30kPorcbB8ElijRgmc+Q
	VBenjdYhEvF8auXe3H6v5782zGKbTCdhvWzvJt0cGjx6TPpEmANx8qHqQEI4eaQouiosBvIG5T3
	W9/6H6erNeyBsS8HnSkkwniht28/Wif5s7ItITt+eRLF8sZD45JuCJYvL+tiaBVKBRRuJBFb1n8
	76pKng4wJV3mMtpPRafJBCknLwPNayuOKkJKGmQi2YkgPUnoBK+EvbcFDqZX+bkzn7dSjKohbpy
	q2VOmrSIzyWTo8sQvGA30Z1/xfqDVB7/1043NKInLzL9mpg==
X-Received: by 2002:a05:6000:248a:b0:48c:4442:54e with SMTP id ffacd0b85a97d-49584b5afe0mr6225635f8f.30.1794214198288;
        Mon, 09 Nov 2026 00:49:58 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597090444sm9069465f8f.31.2026.11.09.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:49:57 -0800 (PST)
Date: Mon, 9 Nov 2026 09:49:56 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avGIMja1yTAkG2X8@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_005001_276206_3F3A1050 
X-CRM114-Status: GOOD (  16.38  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 08, 2026 at 23:21:08 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
> > The S7 firmware exposes clocks through SCMI, including sources needed
> > by the other clock controllers.
> > 
> > Define their identifiers so devicetree can reference these
> > firmware-provided clocks.
> 
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?
> 
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

Right, I'm not strogly opinonated on this, I followed the existing
Amlogic SCMI headers, but I agree the dts directory is a better fit.

In v2 I'll drop this patch and add the header to
arch/arm64/boot/dts/amlogic/ with the DT series instead. The examples
of the two bindings you just acked will no longer include it though.

Thanks,

--
Carlo Caione

