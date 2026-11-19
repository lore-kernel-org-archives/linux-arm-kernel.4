Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 01:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pu1n93iL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLKD4rdw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=; b=Pu1n93iL/ZEh1a/w4zbFWEAXKR
	q0go9vxvRp77svcEAH86pj8sc/TLFln1xI27VKrQTrAiIHlo52XwwK//8jTE7oy+NyBAvQ1w9tTCf
	rQpse/vRqoD2WBNLfKIUXj8UqCOsND9vIpHfKa+DwfZLFsnKG2EnazpjBqaNw3XoCol78vyDgSb8n
	hIVTG3MZv5ZuQeyNmmYbE/VCW2B+PDwCkHi1bcXNcNSCoP3ZW3ubAeAM9Opa0qPRbxI24p3ypTs2v
	6i6NmDrjTjShxtR/JPix1LOid7yiPXL24Oh51PYcSmw2AJHPRTShJHyEcZ9PnoziwpIvskHeFss1V
	OK+COW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTr4G-0000000Add6-1IYQ;
	Thu, 19 Nov 2026 01:36:04 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTr4E-0000000AdcD-0zcJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 01:36:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c505994e5f5so27210966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 17:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795052158; cv=none;
        d=google.com; s=arc-20260327;
        b=hZls5q6Li9g6b7HGq/PaJpUskhPEnewh+lhdrZyC3NSHFs5y7O/bxWqBMlwFYVB0+M
         UhwXJKUHRpjLKBEkOQYAvEB8/49T2vfyApEH8gCo06bRYCYVpRkrugtO3rrgc2pNzxLC
         zKG09q+KcB0S0UkLbpGvZUDDfu0z8EiLo0cNLjd2s0aRWMJ1aBh8A+t36v5IQcQo/YyG
         8lf5N3zvUBAmDZzj+iJyxwVnyMzPaXokxUWOc/63um+2lgMbW9MCO9lO1X+RnD2vGLpK
         tI+g2dIPD0TaUQ7lX+ziXuIHd9zH+X8dl7cgWHGltFYeExYsCAE/BuFwbevg5uC3sSeI
         opxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
        fh=0ZtrhIuvM9euTSakdmxTyn/xG5toaktAIIRLMzBR4Ck=;
        b=mDqcY1UleFEVf137woPswiPcOMYZOOFO86snOTAntJh/EBniFBIyVwfpnZ8yd4SAB8
         nZ81VuX0KP3Gd6XVjM2Ikdn1ZqGzNSxtfvEyNHA498DfIURAn+JPyxUnwRMMSYQYFlbI
         3t50iCkHNkgK8HXym2hT/BmNah0vL/RH8Tdq8sYgU2RmLfAfiwTQFF5dfJjgUvyoN2sW
         rcH62zqYrweQokwGUKZwrMMzck3GmT/cXhXW/wWvsXtL66mXMx/FXQeCvanU+vuAh3Wf
         fnbej5Q08tIpT863O1sm7OVrDLyVFeiCVCpUyCKXKnAuBtlTI53Gq070kH6QYNRh4CGl
         lXGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052158; x=1795656958; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
        b=RLKD4rdwg7AX6q6Xv7pL46VABEUr2hG6XutVXVHPoM8EcI/QtmiQzX1R72PY8xyAkJ
         D8NfMPl0Mvwnok2jdxKhfgKxHi40WxJ0pVHmEMky6Mtx/TsLAz8fClu8ydBEomhh2k8b
         7mcldCN6JK4q1Vr0GXpaprI1Phmx0pf99Oezq/poINZzO/lKWguaSj54lROikD2DTti4
         JKu4frlISQoI5TdbP3c+hZhA8PTrErx+Ol0a9jSBkwwOezEXu+4AZaCrsP2w6Mz/ARZw
         uBy8i+w+pNC4zGnCGe0JTOMOkbaFCZKHZ21NlPnZJ2YrUfbz/w100Ztlbz+uCHtKrCyj
         9wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052158; x=1795656958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
        b=fdm31YY2pxjUx0ibTaqAlpv9FMTpMXpuNaj0oLVeCPwUKDh6tX6B0b+sjFRoGRBAbg
         6z8N3Tiyk9rmF0DXMCqDfz1g6IhAZMl5qDfZmSRULiSzs/dqDPcmUeDFrcnYZoogVdds
         2aRX0rRu7JoMj07ueNT5NmLscwnLusVqnOrdUOOaJJxnGHbpVmFjh6vv6QtX14XGHFju
         sE2s6BGaSF/7gbinc/GGT8FfFUNvOni8iLVr6oOIDjDrv42Plk6vWdbqQkULahpgYNkK
         GVDaARDXcwOIqckbNkda3VRUcwj6LMsZnIXJQ+UwDHq6xJ2ysxoOx21dIQzl6na+yI0O
         /D3w==
X-Forwarded-Encrypted: i=1; AL+hErFvPbHWD8J52ZIe3iWjkKWxyhT1qfnVAQnHNdK+WW5Cb6UIejuGs0GG2zbHUYZ6xJrFq7e0ksdFH1HHOV+4jn6l@lists.infradead.org
X-Gm-Message-State: APuU4Z87og08Cy1XWrlTGF80kdJry9PbD580T/lgSNo07estTzw7nRZ+
	B6MnBzekmYgbB3G5CrIQHsLk3ntdNzJqUz2V+lFBkXkujhPcecY1bU1Lz3FGO5gvZWrNGtB252N
	kUrpxjOKKOzRU77LQWQV6C1OAhvfpPvSg+oSgRsUxPA==
X-Gm-Gg: AYBFou0+pNVj0zpGGUD5u1y4Rn03B8lQn4i4KKHZ7MMXmJxF8WzZT8zCYSVJdPPj2nP
	T9d+MfM6UksRt1zkGeBaYe51P3jAb1y5CkqL7l9JfUAojOEDGOtCRiHwCleehUXPHxrt2bjVQb4
	XN3Z3Zn+put62jv7PkrsNd2PPwpYw8rfRqL+U1N/RqQEXPnrRkVNktapcsBZLCxrJDgwW1iM1SF
	yn0tllTA5ddhbrdp2olIJfa+D08Mi3Msw5vRAdmn/indVfLfnxMBtz/JTz6nA/gbk925/OMrw3t
	4XTbJLfcW/VceK0+4JTkDgBevZjviyHf5DIxXE3vw1/2haXXc4Kh1ZMYxtcFPMg/9vjP1p0BEco
	BMAtWk5eoe1gAWL86mzrtkX+j29OKZ1tNak+9YqW9OBoo4leJba00WZPeAsB8xQIDarPV57k=
X-Received: by 2002:a05:6402:446:b0:6b4:2960:d381 with SMTP id
 4fb4d7f45d1cf-6b887a7ca45mr3534756a12.1.1795052158003; Wed, 18 Nov 2026
 17:35:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
 <20261118-dcphy-rx-v1-v7-2-8de1adac3a74@gmail.com> <3a9e999f-5ff5-422c-aa65-b8560dca84bc@kernel.org>
In-Reply-To: <3a9e999f-5ff5-422c-aa65-b8560dca84bc@kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Thu, 19 Nov 2026 09:35:46 +0800
X-Gm-Features: AclHuK8yzTD5Ny6Jae8xfaKIWU82OgGlGfteSTdmbBGr1nUYx7XM082OBv9L5nk
Message-ID: <CAPwA33KcMNnyBEeWkheaEQYUp8FhR+xOdrfv2CAEhG+YuAV2Vw@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_173602_301769_E678F1E9 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 9:16 AM, Krzysztof Kozlowski wrote:
> Please drop the tag, this did not happen. In the future, please add only
> applicable tags. Otherwise share how this code was executed and tested
> on the actual hardware (make process, like building code, is obviously
> not testing).

Hi Krzysztof,

I will drop these two tags.

Best regards,
Jason

