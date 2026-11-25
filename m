Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE65606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rl3+CdRP;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cMH5pvAi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=; b=Rl3+CdRPwM/7Zl
	lb+Q2qhtriw7i4IhJoLbt2kfTstO+wWOSONz40qE5Fy7IkmOn4WSJ0mzet0mEwhWgCEvJmPCboDRj
	sikQmPPlIGtWIjAu4YHBvH32MlrzbnSggp010T4ZHe/WJ3DKzqFYufHLHS0H7Xr+/TXrMwjsoGRlv
	mGheWc3NoBggZIGLrct2yq9NxT+NMGLkq3HSDsSgwH/8NustQIHYXCznSkp60SKQ2gji023sX7j2X
	ZXMHWvg5IU17eE1+cbVAf/ybEHl/ZdY2tSF4SGHUf/snCWB9cF27b3F1LAWBK89ergTbD7xy5Lj9f
	auKInSMFPbUs0NVXZDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW85h-00000008zK1-20T0;
	Wed, 25 Nov 2026 08:10:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW85c-00000008zId-39mJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:10:55 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5212240f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1795594250; x=1796199050; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
        b=cMH5pvAi1cGu5hVL/zAUOTSZXe6GZJETkozO8AOsvTHbfwhsSYIGKhBl5N5CzTKnT0
         YCSw1l5qESqj2Im4l683rKSlDcYw4Ye1eXk6QyZt/xB8/CSMG1Lx86hjnwWzGwjSXffn
         SbS2M3myxNJtFb9UuSbJFVLxCE8RuggTRDxGTrZRGZcNP4a/xMKw3DI0kl+/wO3HBT47
         EBkmxlcHtYDvZ5tjJBZx4avwbfw5qKrhCxdYP/4bd5zJlDAPS7ypQanq41neJP7Gnfny
         Ew4+dUZDh5SBNsuniukRAOamusFOhyif82eBBH/7uowTXT3nEaAjmC+sPJLdHsNNq/BQ
         Juvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594250; x=1796199050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
        b=1iXpaXmmH9OsNN8roBm/7jN660Rp0Wr4Ded+JiZ54Z5siqEshsvkLUixsnfXmggIQp
         LcnCTDIdY1cmW62My6hzWcPsOxaypwo5GahHUQixzreAYo2Fm4/J9vEoB+ZpZ6cOhvEP
         YK7Y2zGaDzpsBgGmocqc9ncpH1VywUTtLWm4ba0OEYE26iQ7HqRpcZczIBR5aTmo1iCw
         TyctVwosAB1H7pwFtr09TQFjB1ALmNS8f3+tSOrLYH6dv+ppx/OVWDT2kMVB5J/gUmPp
         uLLtwNY5meu6uakZYWw7SHY4uvG/XzfRb/JF7OaAUKgf9e8zcdkPvtu/jxau/eosR2IV
         47jg==
X-Forwarded-Encrypted: i=1; AL+hErEf6qQx0fAy7V3CKQi7XoVdkBJgBWVgrXMxiS0BhKG/siKWPwboU9gFFxwMalJx+V1CmejG0j6phjkHkt7FOIfL@lists.infradead.org
X-Gm-Message-State: APuU4Z+ejvLicTAdJjiq2SZkS1rfqfnsCa13jRMSE3BNS3WyJrSQLgcQ
	V5hlldY7er40F83dMC1Mv4PvkIXa0fwUPJHNBDMmQwUSPxVLpkVj1TB7WknnG+3cSSs=
X-Gm-Gg: AZFdTZe9lt/UQBGt2PLr9ik32iMHCN7c1OUv1xO1mbTBu0k7bHey80Z5tOm1+88olDp
	LNER4xX4r3QPi7aL7C3Y3IGwHdUT9tlFYILfWKEDfW5XqQwBtdqwC/5Wnm8dVLJVz2Ol4XV+1De
	WDd+pPWD+D1N8m1+8KVAHqGrgDwgXslxslD7Txq47ja9cYaS9giRFR9RNWbl6xrjSeYJmNh47xK
	hAzKeApCTqqpEpetUkhfT53oAO8NUcCjh0FvO2oWsROd4M7rKZFfK7WbVYxPyqfELVLJQ7uZVQp
	EwwOHSOkx14I58u5BoDbbuiygqQQpfug5bcZZyaW7Kif8JRqN8mZBx3qFY0KKJorU6bQu2S8Fn6
	Oby8+XEObhRZ92UszqWmVYOYcp1ARR8khuqQGtYOLrzj7ztxTdhONYuvC7iPdKGhivKiSLgZBBU
	j56WH+/2ewFxPzKaaCnFLLK9IQ53SNMs1djb0Og7bhLTaxdSUD0ChlFXMt9c+3mQiDK51wiUsRN
	QiM1apmfMV4Fyh3ljdouzYCHkEf8OdpYS8BvSukFvTuodK/Ecz8poXIP2rxDIDSoO2wRyJjYw1X
	+dKG1eyo5BmNMFS3hVDFhng8DufwTn+4Ct7ZO3ONnenp1C3aaCoyaiMpyhAT98TQJXCsUQ3Ril0
	=
X-Received: by 2002:a5d:5f93:0:b0:4a5:33ad:871a with SMTP id ffacd0b85a97d-4aba56f470cmr32677127f8f.0.1795594250026;
        Wed, 25 Nov 2026 00:10:50 -0800 (PST)
Received: from [192.168.2.69] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm31415134f8f.0.2026.11.25.00.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:10:49 -0800 (PST)
Message-ID: <f7fe449e-5dd9-4476-9f1a-100466dc0c8f@bytesatwork.ch>
Date: Wed, 25 Nov 2026 09:10:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI
 controller node
To: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Michael Walle
 <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexander Forsch <alexander.forsch@bytesatwork.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
 <20261124201110.GA366860@francesco-nb>
Content-Language: en-US
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
In-Reply-To: <20261124201110.GA366860@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_001052_907170_D169534A 
X-CRM114-Status: GOOD (  18.43  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Francesco,

Thanks for the feedback and the offer to review/test!

Frank Li actually just applied patch 3/5 (the i.MX93 MIPI DSI controller 
node) to his tree. The remaining patches (dt-bindings and board DTS) are 
currently waiting for the Youritech et050fw01-kt panel driver patch to 
be picked up on the DRM/panel side so we don't introduce broken 
dt-binding references.

Any additional Tested-by or Reviewed-by tags on the remaining patches 
(or the panel patch) would definitely be very welcome.

Best regards,
Frank

On 24/11/2026 21:11, Francesco Dolcini wrote:
> Hello Frank (both),
>
> On Wed, Nov 11, 2026 at 02:31:17PM +0100, Frank Obergfell wrote:
>> Add dsi node to the i.MX93 for support with mipi dsi panels.
>>
>> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
> I am not sure if the other patches of the series are ready to be merged
> or not, but this seems a patch we should merge in any case so that we
> enable other users of the DSI interface of the imx93.
>
> What do you think? What's the plan for this series?
>
> (yes, I could test and review it to help, I know :-)
>
> Francesco
>

