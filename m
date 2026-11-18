Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FF1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJ3bBcYg;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WtTrFE6/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fApH6YF8/olwr8rszx1618Se8LLbeSsWPgcCTgBcSzQ=; b=qJ3bBcYgIvXM1r
	xHSBi7groVJdTsTOmasNiDCdkSQvdXLYasfeAi4vTqs/FWYGTUGrw+7FaXED+/IK+xpOFXXhWEOgE
	GgOFReUXGYayVo67usFfbHZ+h3X4M5kqTW97y8k7AGGBFXrt+vuwmS4Hi89BQ0Ig5lHqOvn9qsWO8
	mpxzIKSMlblN9wngW/AcxOIE7hkZPCmWnhAEJOD65wILlLMnkuFHPROn3roiC9dBZfigH6ebmWs7W
	uuWhU8oB3rk6sS629TPVOL4R/xrVwP8RuyxG3JCflwrtjwtsyV0Uyu17oV4eScw+unD49Oq71oFQx
	VHlUr3wTz1sSXXsX4Tyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTemN-00000008qpv-1KLI;
	Wed, 18 Nov 2026 12:28:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTem8-00000008qfj-2Ebc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:28:34 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-491971ac844so871164f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004911; x=1795609711; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fApH6YF8/olwr8rszx1618Se8LLbeSsWPgcCTgBcSzQ=;
        b=WtTrFE6/y7fUzlCgS7AJi7RdX7Ec0ReUb19oZKlslN+cndOmnKN5h4q5i4CoJTBVxn
         wiJg1OKxqSMhKsVDEHrmpAE1jzqPCitApR0fBc+0gCXE00m2j7k7YReYTr/TxW2uo7aw
         SJrs6hHLNO3PIg0ygFM2hyoUzRuip7bC0k7lrEDpOIFcP4GBe1anB0UOd7E8/YmOCmz3
         8Ac4K+/iFJG9RJj5/HicI0ga/29phGLb+bG11XeiN9aTFLke2Jl1BfiXu6iZxhbzrhGg
         dg7S0r9gvd3pZnJck6bmPBEbky8rJk0uKqhNFMDTh+epxziPowzodQ6QiSXkjb98dcOs
         YEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004911; x=1795609711;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fApH6YF8/olwr8rszx1618Se8LLbeSsWPgcCTgBcSzQ=;
        b=xUV7XFZTKNqXE68aGkiM2m2p67kOfnnSN8XZv/FLtPO7Xwhq9ZUNf/coB/DndfCpCO
         ba93Amr+IDbClkLlfDKt9En6h/440cu1SvwPg8SBNFppbkLgujVGQZC89m+IX0Cl6axG
         sDsuXgJDnjuDZsdNzTXMCSxTr8wLLeqCYOBCNDn2Xu1zM+Hw56Jubs2lVhmdod8InMdm
         MIg4akNHAeOetNzLCXIFmntkfLAiWMPQtUOeDLaumf7jJE61TiXFqz22hw3xprczSLoE
         G9d9addzI45pYpfB6y3CQfO2N/IoVVRCAjZvh4hZCwbNAc9l+IRk1TJTLcQz5ICzYRCK
         y2xw==
X-Forwarded-Encrypted: i=1; AL+hErFvyGaUrh6fvXT7RGTT9GE66CVLpk0JeCbipkn8cotbePSN/TqqHoyHDWYsPtY4uCXp7BZ/uLzTyMoCrM8Z7Ou3@lists.infradead.org
X-Gm-Message-State: APuU4Z9pyuSHmqLc7AJ2KeZlJG+5E0y2tjMbCXmHF72ciNNHsWaJyFJJ
	kvh9O3OStkORvYnUL1xwdvoWY2pj/uAptc1kPblOrqnloyRMLVkEblUln9pMMg0B9Rc=
X-Gm-Gg: AZFdTZehddXJ8flh5WkUJmnmShCVjVXa0I3h72qbnJquJjEwRFtmNCb3RYfG7qzpfrc
	mogdr2wH8aZczymlRoOAHAXl7i16Sgz3gnEV7Ji0vSMNCDxcvLzHhZBRjK6kOtUBGrXq9QgDDgw
	Ob3j/7MR1wBWxkut2ua0661+gz/p3zmX01X08FfpiE1/edbkiU2P51YaVotfGPJu4rpobMOiUxq
	I336ckZtI2+BYWja13CHQy51XGiIrV4NXYs5tvhwGLGH/LmU7TDUtftFp6O8BJoRpkvJiNwZlRo
	P4Hh9v0v3EHSDYR4QkI/ZeLcs4RBTG6ywPQBa4p2s0ZE55v6tnqhh4+dRBzFwjGSPRAvOHHGV1v
	2BFK+u6FnCRRwv3CqTKw7pqc++RvuGiSoqmDQQIyttpNi4JyzysZInw8A3l/zt9UEw9FARh4Dpd
	Y3aw2xa9hd6AazsY7T2p3YsoTDa8FNjVJjmawCd0sMok6CXKI0V9MrBCzX3eCo6JVpxbALFj8i9
	1h3TPNZ4CAEoT3iYCeV2cCisj53FHFmRu4q4uxEpmrAH9O1Ry+HT57cCwLHcZGk9wRiancAptLw
	jt8g9mu4/EqRvK73Wqa+m8+3bvWsr6Vuf+bChs7NZCM9bZqUm0LoeJVO3AwPan6vSfMygrY01wj
	jkA==
X-Received: by 2002:a05:6000:2f86:b0:4a6:63cf:99a6 with SMTP id ffacd0b85a97d-4a663cf9ae8mr4421294f8f.23.1795004910709;
        Wed, 18 Nov 2026 04:28:30 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c406sm4567452f8f.14.2026.11.18.04.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:30 -0800 (PST)
Message-ID: <15dbc800-ab4a-4b98-8f6a-95d2ae80819b@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:28 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 12/12] arm64: dts: rockchip: enable the NPU on
 rk3576-rock-4d
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <c0d64d55586774802bdd70defa016be6912ab83e.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <c0d64d55586774802bdd70defa016be6912ab83e.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_042832_668803_36E035A1 
X-CRM114-Status: GOOD (  10.22  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> index f068794e48d4..72b251d396fe 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> @@ -779,6 +783,24 @@ wifi_en_h: wifi-en-h {
>  	};
>  };
>  
> +&rknn_core_0 {
> +	npu-supply = <&vdd_npu_s0>;
> +	status = "okay";
> +};

I can't figure out which code actually acts on this npu-supply
regulator, even after considering the patches in the "pmdomain:
rockchip: RK3576 NPU domain supply and settle delay" series. What am I
missing?



