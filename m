Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FF0606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4m+v7i9j;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2Gr0zPZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=; b=4m+v7i9jUVKaxJ
	PA1WPxOhomnN008PWj9DhIVFSqu3HWaSNFQN5RQVwITZjjXx5XVQc6iZqWYxXVDvTOtwr4Z2UpExN
	agB6pJxfAmy5WxH2QB4pYmm2phzLnUqSCp8rrr6kaFn07nipgHL5YfTc09ekvS2hPzLYryTZrmjiI
	deLgKkk891NI/rJ5dy31BuLyfE49WI9x1HFpJTZfO0nDoyzXK4QyaqhqcSW2YpDY7iBWB2wl7n/vb
	mH6QWK1bV0C8r/DkqAr0wEb5Its3IrFEBy19CjakPm284WAEr8qUaKCfGb5c7WaEOmpqHwOuVlcKS
	YrLEkQHwWEaMMaN9CW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxdy-00000002oZL-3j7M;
	Mon, 16 Nov 2026 14:25:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxdw-00000002oYD-0sKF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:25:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2124018b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794839111; x=1795443911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
        b=R2Gr0zPZyG55TG+kOlCR/+7GeRXd8ajuEqot1q8EXB3QJ2oCAxNYZTL0qmL9aG7xKo
         2ZF2XTrLlm5OgDCnJhvbpTVigsgTc6uwwwjo8+NyKDnsEv7E8gyK2r4/AD7mvkBja8lv
         XWSCJq7DLk6o50a9YzwLu15b7vNwlQdKm5+9R3DJWZJMKSjGUinl7zZtzZ0/e00QZHak
         I1N1hU71NMB6CUlTxVmOl8EvqRaJ1RY6f3MPKIzvpdxIlfzd7fVuZWDCKOLGSO0xLzla
         kbbU8aB2Y5TzHuZ0CTLaYmQ4Bd1c6T5dyZWcVApaPAVjz0icEXKODtzn/58jjWeUZeNy
         I3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839111; x=1795443911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
        b=LOVtSqZID5fn5kk7/DHlMCzdmnbW+jE3hfsWut3rZmOHfa+UVDM+/HuCxKS+5tqXdx
         /852alyvuyw336xFppxbuMGNtRrfE69Q7xkJ8C8gS31UFE7Rgc2wNZFo/lXtC9c8WJMf
         H3k3UZ6YfDUp980fedmT5S88K2AGtUcs1a8NIDcP5/S7sLf5rlOuIHtAmslwnbdjgSx7
         pn2gj1HY1Qt5vfDO+pykA91IF6dxf+GzZ8ePYUeuvp1rtpkwcwo8/uqga8JeM1QO6k/J
         F2vbZiDVZkgxv2z6hn8rZs5NWFl76ikkLDLdsPZ0wqsoU+pS4ArU1ZEYIhUnkupIfsCC
         lytQ==
X-Forwarded-Encrypted: i=1; AL+hErGU1hHIjQPhUbA9ZZnR4WDih61cIx4IpLRZIeOODkozv5jIle5ZBiKmgOm4BdvhDMwFCvBqkbqEjz9mhnVGysIz@lists.infradead.org
X-Gm-Message-State: APuU4Z9v/eqFKN3KKI1Sj8+4Da0GiiRGFsSfJRQVkVzEj8sK4qF6BKbw
	dhmfgcKWtMxBq1uu516ZlzKZZT996/skBJi3VYfliB74IKHW/22aEO9h
X-Gm-Gg: AYBFou2YK/dKvxZvpEamHQSVqUFtTjONFzOEGsFYPckNqnR7EPOqotH1SA6sjy7gaOy
	8P68zpFon218G//jTYWASsGTb5RT1rh3Om0sZu/wxjsTnWNeBvbLDA1g+RspAdf8S59tl9SaZCP
	tPyD2u+0mBvaf84zEYfrx+Drau4/fTdmTaN3cBGdFrnSdVrwFA0W/hnK51YB7CUbIFL0dQRwlvi
	UYBKv6rjOFxsq/FsIEdqTWpGwh9WMCCr7TqjGhqpX7CuxptKa3eOaOrKvFqL9bURNiNg/1/hGHh
	b+XMrF+vopm5qpssgpTEwgkUpjJCQshnYSGFn5t9ddeWVUxV8nzSR1eNjPptltg19cIXgAFyvQr
	w0ZBLxtP+lOS94vWbGM+Yp/6+CjzepSEGDewse8FAt9z0bw0PSfKC4J1syfC0EqboP/y7L7bMrs
	YeVVSKYBbUQL+Cy1yTZ4kTKgSDZc3m//Q4NmzAenoO10TavUEePZc4gTAhYyJ9U1ZCUftWu76zz
	iCoH+52BjfDQasFzB2z4OHvQk4DW2zfu44yiYKA/CMvlo5PbMnC0bvBv3m6Q9exj1b7GnHuogk6
	r1OLnOe47VxL+joU5dTYqBSr5SNteldKEz0x/5mxYE8QKfSywctYKGDtIHNm
X-Received: by 2002:a05:6a21:8883:b0:3e2:2234:62a with SMTP id adf61e73a8af0-3f7a84cef9bmr7584081637.55.1794839111006;
        Mon, 16 Nov 2026 06:25:11 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm3834158b3a.36.2026.11.16.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:25:10 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jernej.skrabec@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	james.hilliard1@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on Tanix TX6
Date: Mon, 16 Nov 2026 22:25:03 +0800
Message-ID: <20261116142503.671907-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062512_251808_7C17FC4A 
X-CRM114-Status: GOOD (  16.16  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jernej,

> The AC200 MFD and Ethernet PHY drivers and their bindings were merged
> in v7.4-rc1. This series adds the device tree parts needed to use them
> on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
> Ethernet port goes through the PHY in the AC200 co-packaged with the
> H6.
> 
> Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
> the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
> from PWM1, the RMII pins and the EPHY calibration value in the SID.
> Everything stays disabled.
> 
> Patch 2 enables Ethernet on the Tanix boards.
> 
> Tested on a Tanix TX6: 100 Mbit/s full duplex, about 11 MB/s in each
> direction, and the link comes up both after cold boots with no
> Ethernet initialisation in U-Boot and after U-Boot has used it. The
> TX6 mini shares the same dtsi and was not tested separately.
> 
> The arm64 defconfig does not enable CONFIG_MFD_AC200 and
> CONFIG_XPOWERS_ACX00_PHY yet; I can send a separate patch for that.
> 
> Best regards,
> Jernej
> 
> Jernej Skrabec (2):
>   arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
>   arm64: dts: allwinner: tanix: Enable Ethernet
> 
>  .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 ++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 53 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
> 
> -- 
> 2.43.0

Same AC200 setup on TaiqiCat (TQC) A01; I'll send the board enablement
separately once the H6 dtsi changes are merged.

Thanks,
Jun

