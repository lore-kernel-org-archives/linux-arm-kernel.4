Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDF8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jv5peWfj;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iWCdwIpm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=; b=Jv5peWfjGahGzU5yiU2D1OReEv
	SYs/Q/cWqIc8GLxbqvkMqHRe3M6FoFQm/WbmRpRDg6EQ+AcFRW6hMsKtg76Z0MMrfyxpHalXFHXws
	wyWRQuQIsW3cC1URqigNmbzGnpZR0t06No4QGzgIAFT5/VnWN5JSUQbJytwyduouR2ZkWeQFndYFi
	o594R8LnyLxRL1Rwn+TC+l2YQw0VD7lSpdbEFxEhbvdqp0g71JM80gdwMJI6Lwye+cVEz3kVZqo8f
	/xDc1TLUtrH12ZmF6i+MT6vkllWBOiaAnZrYl/Cpo0KvcN9OwWZreja2Ds+QQD9AD4xtS34c7xeaa
	0NXXEZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuDV-0000000Fq7x-2IEY;
	Fri, 27 Nov 2026 11:34:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD1-0000000FpRO-1rSp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:33:51 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c5133831027so1111591466b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 03:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795779221; x=1796384021; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
        b=iWCdwIpmsVU3wxsoevnhiGdgW3p6PHSdnY0dmlLHnG5VlJJCO7ZClIzwsCJvtFHFk8
         JG6Fr5RWr4wKWYHQY4Vs3S7b02r8zr2Te/5Wlg0VPHT4PDQeuRA6LW91uMXh2rdfG6bU
         LVLF92cXKf8QHXJH5wLfycKmsXRvJaJGcEGajrWjTZzglYbVl0AlIitgLMfN77QwScd9
         MMrkkJFC5aQOmiqfs1BjNoHlZR09TvXy6g25kjXgFXLX6I0wwFura2odq08d+ZSy9CMs
         m+oc0m2U/BEz4o9FBCpdB/aeYJnI0On3t4FTxP+isXEeBwDrIAenyhBV4vw+OCGSkZEe
         RxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779221; x=1796384021;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
        b=zqgLr9FtBWQgUoP+lmkWtch53kDO9h/4vE+aDc+mu0Oey5UvB7ncEgk5XDIIcDUePj
         FSz/47Vyz8pqAQwdm8Y89hGrTQwVG2vlbDqp6Zz0R5Tlce/ehNxKJiR4tGqtcmoPu93i
         W9PAAKUjBU59FEGA2baaODYE2QNFh5aPoYBymIuyYC/1RzynsP+p2sSb/YAEAwEetNz7
         XOBX+2ImYoE3IFJVcGCqpF5xuAnb/FIxUDPVrmRgMskSqeBf7uwfUlCA4NzneuC3MN+M
         /o7ObnyVVG7l0bkLPFkaPBeQDCQmou4oEK/pZ7ZBn3o6OjDm9q0HYDImV8qf2SBkgJyw
         n23A==
X-Forwarded-Encrypted: i=1; AL+hErEt5Kdb9bz8Xsh26nz85I+Ets1/IortjtrZkD5x9XyVoh4MijU1gHTTUjksfeeyrTDo4anCsmG2O+l2YPLAIrMr@lists.infradead.org
X-Gm-Message-State: APuU4Z/EWdtb0GcXh5E7FFsGpFrPZletU7eGmz3KWHoGoalemTJWMTm7
	4poTT07+Z6Nk8hBKcrma4DXSuAED48sfm0TUl4r6LHfypzbWGPanfeEAOv9T/as0Q90=
X-Gm-Gg: AZFdTZdoK4y3XT47WUYKlcb9XEc7Pyl3vcOOI2+0TT+7Bp39JTPiPVJnMWfnajK7BCB
	LFl6rQpcgAE2a79JtkT781hsJ7SHbNowTr26DnelvWdybpAskWmo5acCDDEcntF8pLuZ9GQv9O8
	LTO8lBGO+yWNN1RCkUsTrCHl5jErd5C5lfPCLNcTjNW19A8XiKr8AbFOgABBYCA0mQ29CQd/cfg
	f3fodAlN50bJh9dFWQ+9NMK7plI/NVFxC+Aaz3lpDRWBjnFG/SS12o8j1QxrtvIltgAEv61MPpO
	csDvOqqTQIuXauu6aO4799Jno7/MxKU5Du7FRxH5qfVQ6sU2XLI8Smoco7xn+dZ2gsoxhHcH6IO
	PjPd4Ln1aSCjdusSZVg510GxZPrYtt1al5K6cvw+uD5QtXPULjUdzJwC5p0j8f8YZJp4FjN+0T1
	d4gQvH3EkTgXocYPKrtcdBugA/lmYplIeqc1l1v9jDs/lIiI5swKc2XKmcdX720r87mowp7GnFm
	kq3djWgbw8N8PWZXWHs87HbjPNDUrlfOTftmSpMZ6gNU93ELCwyL7F3BBs5ToaZLW3vyrC7Fnpe
	CinesfEzjAw4xeuX/u2hLoi8pOLmwAKM8J3mqBztI4jR+IqXXWtJZs4YdTBA9iPs4uVxEw==
X-Received: by 2002:a17:907:8e88:b0:c40:80eb:c543 with SMTP id a640c23a62f3a-c513a4347famr2083302266b.4.1795779221611;
        Fri, 27 Nov 2026 03:33:41 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm830289666b.82.2026.11.27.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:33:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>, andre.przywara@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo
 Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa
 <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Cristian Filipescu
 <filipescu.cristian@gmail.com>, Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
Date: Fri, 27 Nov 2026 12:33:40 +0100
Message-ID: <1jik1ild9n.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033343_520787_62135E40 
X-CRM114-Status: UNSURE (   6.53  )
X-CRM114-Notice: Please train this message.
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

On jeu. 26 nov. 2026 at 15:36, Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

> +
> +&pio {
> +	vcc-pb-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pc-supply = <&reg_cldo5>;
> +	vcc-pd-supply = <&reg_swout1>;
> +	vcc-pe-supply = <&reg_bldo1>;
> +	vcc-pf-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pg-supply = <&reg_aldo1>;
> +	vcc-ph-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pj-supply = <&reg_swout1>;
> +	vcc-pk-supply = <&reg_aldo1>;

K is bldo1 according to the schematics

> +};
> +
> +&r_i2c0 {

-- 
Jerome

