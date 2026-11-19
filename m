Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A3D60A2608
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JbLTWkcD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wqf31zqC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=; b=JbLTWkcDu+N2WL
	+PwDO71h+6yBU8w4CK/Y/mPdnJC1uz+6X4xtm02ei+Zjw4UERozPTQeWR1xKqReD1fOGspI/rICGW
	yVUZ9nGP8mpAQrc/M2Sb11c0I66IgQSnxPY3dae6N0Yynbjbt4nB2DMXTvGq9rJn3pyHTGYzn5PHa
	HbuvlVt8MBJiRm2j1zqtfbInY2brlS4GLq5s0QQMAghacnPYx9sRFQizf7nPx8YzlpXgT1fbObYHO
	kYpMkpCLCjJj9Y+s9pcA6kyQvq8ICXPPAuUtMFb131Ad/FmmePJO6d74SLzhcXsVUznJZE0xgPMgB
	zXWp7EMp/37rsmyJ6gDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzaU-0000000Baao-2dsJ;
	Thu, 19 Nov 2026 10:41:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzaR-0000000BaZl-2hkq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795084910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
	b=Wqf31zqCH7nnXFaczrAGwDg/JA+U96IdYChaGsL4J5W75Vj4pD3T8OxwXUiBvYa4rdvKd+
	UvUVkbr1ac7j6qGrVLAfw8UISyNhhdPd03Wqx+xwFMzwX11rotQZwq8GJhu+Wrr8ye4dlt
	DgwG/4CSuzJwXISvXdtmHppPhqZOFYI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-E9KF3O1hPIaKsM4uTJJraA-1; Thu, 19 Nov 2026 05:41:49 -0500
X-MC-Unique: E9KF3O1hPIaKsM4uTJJraA-1
X-Mimecast-MFC-AGG-ID: E9KF3O1hPIaKsM4uTJJraA_1795084908
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0af48c18so1406237f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 02:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084908; x=1795689708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
        b=c4UnCbFdJ3wgwViLreQSKaNKKrteayfJ3zl1Kg0yOG1HVCLMNxIERurXFlWfpstXy1
         0tGveQq5HeEhOPbeQRx6gY47g2JgqCjsgBQ2duBUWeQApi4a4611MqSuGrlU7lShMFO5
         zbBNn1Iz3bWEUjrv5hw3LV+Tw5alGbQc3taxG1JqfjNslYW4DkxLtApDJ0A7k7v6kc6E
         B4KdECBbpHsVq6quNd7BkjUAlgwVXbCHLnTDFrV+OxvnYW9+1lM2m4bE7okSbz6HTOTe
         diUjw2YBz53sMquqgshL/WoQj/qbme+tXpP/WAH9q5IihLS+bD0IolxMU3f79JR897cV
         W1DQ==
X-Forwarded-Encrypted: i=1; AL+hErFmE3tc9FAsbBioA6SGSev9XGvu5wPVyXrDoJtfe/bqoKB9xGidmCfEe8rFBIoDHFk0cqX6bwCjsOtgMR3jlwCe@lists.infradead.org
X-Gm-Message-State: APuU4Z+tV/dTeAzkXpAI5fKuezSEWzQPeAPd8bP3E7p8F1dViyLFH3bf
	0apl6VZbWdsgxQxgQJZ7PRj+CNoSk0BxTmo2aPdSxWvVFKqlKDVdMmpWlaGWUPqDsY5N81jh6gK
	qzg9qZkptILtLYuXcZTLReZP+KSYkAZl3lwifNfVN0rVWFoFrOqnaVW91RTUGSrzZbzUvO1zL7g
	5C
X-Gm-Gg: AZFdTZf2+dqNTf2d8ynBpmLIVp8J1hp7zwjNqV4BJtB7ZiVY8v440j65xssbqR4GaCE
	RIV7ndElPwyyMwR6otg7O87o5I3/59pCTPw7PaK4tMYLm+W5263GoK//MuHowW+0K7D2C+/jZS2
	+xnzuJYcCBZCyakLQ71XmsGPqPSjPQvc1P2ddb7DajlCmP43wgbtVrH6GEuIq3nkWD6ac/Ks+Pb
	XKVKK2b/2QdNdl8tVI+IGTVfwJvQYqM/dhQdCg3FTjMPh0pxiNjjR0oOAwmS/Gnnnkf1umgwgDS
	SsbhB7uAg5SN3AxvLtZyedRxxP1ZUW0ytke/YahpO3Yi2+wVpyoROdzuvo2HGPwpOpp6Ltrs642
	8IwGtfsnog+le+EEvZVosmmTjFYfxwHFqQZkOcB0yxP9OcXkhFPZq+zc9rlVJNCLsknJxlE269a
	PLBM5fQeXa3DIrRaO4nmimjeCXV+5cAJq17oe9tq3aKiww
X-Received: by 2002:a05:6000:4908:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4a69f2f4192mr10315975f8f.32.1795084908142;
        Thu, 19 Nov 2026 02:41:48 -0800 (PST)
X-Received: by 2002:a05:6000:4908:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4a69f2f4192mr10315924f8f.32.1795084907691;
        Thu, 19 Nov 2026 02:41:47 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656a28b8esm10196704f8f.50.2026.11.19.02.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:41:47 -0800 (PST)
Message-ID: <44ea3f0a-f992-4101-9cfc-bec1ebf6a3c3@redhat.com>
Date: Thu, 19 Nov 2026 11:41:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: Igor Velkov <iav@iav.lv>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q_zFx0FwmHe0S6tl4HsP5AMdt5q2ph28bMx0MQYwTe8_1795084908
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_024151_771478_3F595FAD 
X-CRM114-Status: GOOD (  13.00  )
X-Spam-Score: -2.8 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/15/26 20:22, Igor Velkov wrote:
> Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
> with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
> MAC data path and RX clock to the internal PHY. On boards whose MAC uses
> an external PHY, any access to the internal PHY stops reception until an
> access to the external bus switches the mux back.
> 
> phylib suspends and resumes the unattached internal PHY across system
> sleep. stmmac sets mac_managed_pm, and with Wake-on-LAN in the MAC
> phylink_resume() does not start the external PHY, so nothing switches
> the mux back. On ODROID-HC4 (RTL8211F), after suspend-to-RAM with WoL in
> the MAC and an RTC wakeup, ETH_PHY_CNTL2 stays at 0x260 and the MAC
> receives nothing while TX works.
> 
> With the MAC on the external PHY, SMI_SRC_MAC alone is enough to read
> the internal PHY ID (0x0180/0x3301) while RX keeps running; adding
> USE_INTERNAL or RX_CLK_EPHY stops RX.
> 
> Set the data path bits only when the MAC's phy-handle names a PHY on
> the internal bus. As in dwmac-rk, which reads phy-is-integrated from
> that node, the node phy-handle names decides; here it is the mux bus
> the PHY sits on.
> 
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Signed-off-by: Igor Velkov <iav@iav.lv>
Not that this 'broken since introduction' H/W setup does not qualify
anymore as 'net' material. I'm applying this to 'net-next'

/P


