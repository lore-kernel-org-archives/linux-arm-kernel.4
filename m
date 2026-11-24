Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FhtsqKeC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=g78qi7dm;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=b3NjsCJW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kD1GNiqGMLXsLwN0Ufm7bvf0nYrTqG7Gyun272V+FBQ=; b=FhtsqKeC9SS8FY
	PK+qwf1BFKPFedref3ABsTETZQ9+CTctkaqbG9fNf0zGlqTQPHOs8JLAnQMtTktE/rCCepg9lFXfi
	YM8s6y2G7wek+XN9MXOWeH+Y6Y0ObKd5FiYD3QijOQ3E1RMkGpTyfzRUkikQwihaTempRtYff3OIq
	N0KDZYcB4J5h6n/Ji1UqlXkEoNQQVfUUY+QgdRiGeS3zjZQMuZSeVqM1HaneSO4IoFhM3Y71eFcoG
	HmFzeu2KJBSUlYZzFiogiCB2d2kl+NG0s9xSwUUAU9fYevhFQzBqMBBZIKR49+pjRan6dn4gwd9ZM
	p6+6YtKzcaOOnmf5Fr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrwj-00000006pQK-3vQ1;
	Tue, 24 Nov 2026 14:56:37 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.179])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrwe-00000006pPy-0NXU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:56:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795532163; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mXrrTdkIxFBikSs2buuExLGImnsss5asFyDblSFa7hvcQpzrTygM97Mmtkp/+JfIIg
    lPtNgIbXi6iNJHfbxDM2tGPrvNob4kg59IUcaqNoHOxEcaGJovd+Q8ah6gRwS+tjATHR
    J3F6sQwarR0yWNKI82jo+GLPppvMqdXu3NTffBIO0m6vpZPYB4PqyAsib2GMmAmcvCLc
    /YfumcPpcPU5K/fwK7kcsCPn1eyLGpwLn/iKFuWjsd2TcglmHak2Re0ijjZWIridB/am
    yBxH+fc0vGn7iidGwE47kY6yo86pOua8y4isPOgWFuw8s5XQmO8ZOBSxkoO9SHuOVeu3
    8ByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795532163;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kD1GNiqGMLXsLwN0Ufm7bvf0nYrTqG7Gyun272V+FBQ=;
    b=ZM5w3Jfk9ANqD0Ti5o+IA0ULSYlRb9etAC/UedIyafx7XEVA5d2Vwgy8rW+f/KRMLu
    U6lew/Roh2InlnuduzLJoGupp9DeJs790mJ9rThUGdLHQbibdwVVD0QTBjrJYbweBCSK
    /TJzULbiP+IItbBhNwoDjFrHC5uqXyyZcfV9qui8rmpN729XZShEg9RCC3EyhVXk727V
    vQvVbkoIKSXWnAx4WSTrcjlilWu9Ztpsqict22NaYpsnUCtCXOMf11Ua+SwUBi1c0JfC
    CO662K5J6akvKzdRJzdzqupOl+qc11DOuudWqIElvQOXxWeND+vX4xpLcFTAwJH3rfbB
    0Qkw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795532163;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kD1GNiqGMLXsLwN0Ufm7bvf0nYrTqG7Gyun272V+FBQ=;
    b=g78qi7dmmOKb50cPH/PtIvPHRVAKJ5YEB0z6uIoMX4OFugwvpdjjpdIVAGsex5nEf2
    +WpReOFlNGHjZgArPnEtlF0u8GuMMd//SD2AwxcVCQkb6Yhf2izb2FvgJX4HQrg7LPKZ
    vg0h91GAJ5dM40C2WYH/fzAlpMKyaz2pye7aSMZz1PrhDPOz5jncJCkb535i2oDzZKg1
    Co+6i1vMtP1U+lmZBJUZqEbJ+VZPje5+thfAkN6GhlxiOpoWh04i91Svi4+SElcEmBmk
    1MACSgbbn3Fh23YAbr3ZKxF072Fkqt8FHodVGyN14Hf5WYNCFv0gKSuTBJb2nrsDYC5P
    /X+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795532163;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kD1GNiqGMLXsLwN0Ufm7bvf0nYrTqG7Gyun272V+FBQ=;
    b=b3NjsCJWVhfoMdjRGQC49ub7BeVSemOzYBPiCh/kZv/VLtpY/Mk0kV8s8RDbMvlWrA
    HZJa8lp54imBSto8izBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVWUgMvoVkTTR2P7jtjQyY2AeEP/F"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AOEu13hT
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 15:56:01 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.11\))
Subject: Re: [PATCH v2 07/20] ASoC: ti: omap3pandora: Convert sound card to DT
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <179553168323.264265.7045861860225672057.b4-review@b4>
Date: Tue, 24 Nov 2026 15:55:30 +0100
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Helge Deller <deller@gmx.de>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org,
 linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-fbdev@vger.kernel.org,
 letux-kernel@openphoenux.org,
 kernel@pyra-handheld.com,
 Stefan Leichter <sle85276@gmx.de>,
 Grond <grond66@riseup.net>
Content-Transfer-Encoding: 7bit
Message-Id: <F6716339-FDD9-4F23-B4BB-9C99A13C8875@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
 <57d9a8b26bd2282deb9188d6913976cfee41aee9.1795505160.git.hns@goldelico.com>
 <179553168323.264265.7045861860225672057.b4-review@b4>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_065632_393391_D3463A17 
X-CRM114-Status: GOOD (  11.93  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> Am 24.11.2026 um 15:48 schrieb Mark Brown <broonie@kernel.org>:
> 
>> Convert the OpenPandora ASoC machine driver to bind through a Device
>> Tree sound-card node instead of creating a platform device from board-
>> specific setup code. Describe the CPU and codec DAIs and audio routes
>> through DT, including the external PCM1773 playback DAC.
> 
>> + DAILINK_COMP_ARRAY(COMP_CODEC("pcm1773-codec", "pcm1773")),
> 
> You've added the external CODEC but not updated the Kconfig dependencies
> for that.

Yes, I remember it was discussed but slipped through.

BR and thanks,
Nikolaus


