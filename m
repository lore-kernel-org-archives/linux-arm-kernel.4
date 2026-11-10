Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EBC606D7AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TdT0aFN1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYFYvVWf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=; b=TdT0aFN1y37m1cl5GmA7egitP3
	P8oiK8XSvfS8oqUI911QCDwv+l0MbXq7zEQTr08aPRncRPHNLWII5XMuU6C8rfNv8lxFy1cMi/OrG
	84mRZuxn01Y7RrX4UXK8qe3PwCIofXMg8SXajIYxXicp2oT4xpcjAFlpRci6RYe1JKUyoTckx2GYA
	uu0EIX8QYFFQkq47VqqZ2moUTxDh1ppzDVNBo9kIsyH4AEx13efDtF0sIgRG4F8kiK5dyH2dHde8K
	Zvniwk71Pj431PzjxtiOuwRrCbH0dLz6EKOiqkYGgfejapFqd01U8YLARhWAaSyRAd5Hasoc8ug7F
	EamkOKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoRL-00000004UPh-1FNm;
	Tue, 10 Nov 2026 16:11:19 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoRI-00000004UOv-3iVC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:11:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso322940066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327075; x=1794931875; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
        b=SYFYvVWfaYi/KPIpGUgQet3vwbMg+8ioV4TLuK3QGnH67V+7u4wQovxhLVnyxf/dM4
         dAM3WkCmQZ0zw0i1AexF28j15Yla+RDAUo59k9DKzY2ZDujsx19TPjSltUWc34WU8zbP
         RKEMg4u31XgmHQu/3/PYpM56+V21OuL7ZJ199ArIr04bIGmQUWXoguUtfg/YG5EXg7mH
         yYywwn5uZYhshM2V5VSu8SPWIlT0Li7PVNp/p8/vz06djGC3szx0TbsVpmXxQy/oEirP
         m7Kjw/s783xcRILDEW4Ersqp39yRvmit5v/dwxPH+5FU/LX30Bhgc0fTVszaDk7qxJsc
         DOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327075; x=1794931875;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
        b=UkVMY9nL/+blLme0WYfAlGZfZKIwRZhZwhVjDeRty2IyNmwf5dR/+SoH6Sfd+Ztol9
         +ye64HZrxkbTQXU+vU3OVkVaxLXVgnh2+R4isrLmjynr/L7LhIRDwb7eBsm+fjIX2OQa
         JgBRcW0hbFXWPeZmOUWhYHRly7fOS+qwXnYXXr8vBcD3ZrU7b9WUcahxbDnIaRk5ZnUd
         +nigJcDKPpYyfvPtlHiuVDwQeYaJPT31uGqEADOUo3EkEgCAsK0vtLRtHa5+3s/TGgft
         j5Nfa8njYi3b1suEsB9hWPLbPso2Pe2WF6b/UbqqvSRxaqd5hPH29b40aOh0p6moGOEM
         aycA==
X-Forwarded-Encrypted: i=1; AL+hErE/X52GxmgVkxUY0rNb68tz0Yj6jsFlmohYu8/u5FfRRI8RopSwUAY+CZYltOU1k8gV/aRUrKL5RvU91yfER5Mj@lists.infradead.org
X-Gm-Message-State: APuU4Z/yx7Txt67mVFvGPb70jIm1wlgizRNMkkrgenqdgYFjGAg6cMji
	yLYJtSVgr93b3+I5UlF/pD0VoeSFveA5nu2HAG8u5I4jloSox5F2WFke
X-Gm-Gg: AYBFou0ZSoB84AG4tJbuHfuw1vQ8VqGPRG0JSMA2+jpSrIbIXKAmcRo8wA3sJNmPbsI
	jrYYLOGPh3i0M7LxjmdAsxRxKRyxFeG2hYz25TMpa2J4YbfxiHdzWFVZ2vmwBgN+cZ8NFE3yFUL
	zzZMlbas8Zc2rq3pHieT9++8JlSCfrR7HemfknLC9bQsROzuzkb2xrsQj+ABG6hrW/IdvPAaX0w
	VVB2O4JzVHlt5qJrRcyCZhXWykresIoG18/L1NNs3xUZV8zyWx9KnzmVXLF3x8WnLcROZ4QuwQu
	dBp1TE7/41ZUquwE1E33gR8gfAXBJ8UBZ4vc0kqGhQDPL+8apJ7WDSEXvlURvVcohOjj7L05y1L
	PU0WPqplGoe5FGQIpsNgYMprRykU4Qw7sURWnuNdFqREuuEspDbBY9I33QpcOLSMDDJBPgD6zOb
	juYWHfDRr0lv/CrXP4B8+k2vK3Cx2D/WOUOYOefwyhDm6TD/smMB98O1DiJz2enH4E+IU2D+tTy
	XLNfyF+OTqM1kNsLgkulbHlh7BEZDP7ucHaIG5gW35DVvXgx0ujd8BDUf/U8Ejqx1xRDbh8H7H8
	rd6M19dXJEe75ngZ/8KqRj3ZNBAA2paMTL0xvXmFPhu1hrAnisvPsp90plqYz4jpEM9a/AK5Pgv
	oBfH0oy2j19oc/AU4oyithlFIgCG6saNEZZ1yCussxB721lNb8ebD6N8bL6sWH907Hb0wxP/OJN
	0b6YR11glioaXYhu9i25wbgMCdjezzLDxDAq7LbT6yOBts6gmlM+E0nOjJRHXgXi5Uw5uskuuj8
	Zo3erwm6STbCk/EdmYCP6MBrKJ1jpzbW7kagwDLFg1WKh62n8msudem9FJqMamu3qXVxIdFVS+U
	VQtLl+RO
X-Received: by 2002:a17:907:3da8:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c5049540483mr285400966b.23.1794327074616;
        Tue, 10 Nov 2026 08:11:14 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a591485sm127282366b.32.2026.11.10.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:11:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arun Iyengar <aiyengar1990@gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c aliases
Date: Tue, 10 Nov 2026 17:11:12 +0100
Message-ID: <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
 <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_081116_948576_BB87F0F8 
X-CRM114-Status: GOOD (  18.61  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne torek, 10. november 2026 ob 06:37:02 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The I2C core numbers adapters after the "i2cN" aliases and hands out
> dynamic numbers, in probe order, to adapters without one. The Orange Pi
> Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
> for the header pins gets whatever number is free when it probes: TWI3
> on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
> changes with the set of enabled buses. The vendor manual and the
> vendor BSP name the buses after the controller.
>=20
> Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
> TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
> changes for buses that stay off.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

NAK.=20

Extension connector is not covered by board DT. Use overlays
if you want to use them.

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++++=
++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index d5d39bac5915..98fc83291dc8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -12,6 +12,15 @@
>  / {
>  	model =3D "OrangePi Zero2";
>  	compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> +
> +	aliases {
> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		i2c2 =3D &i2c2;
> +		i2c3 =3D &i2c3;
> +		i2c4 =3D &i2c4;
> +		i2c5 =3D &r_i2c;
> +	};
>  };
> =20
>  &cpu0 {
>=20
>=20





