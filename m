Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510E606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FyrTDV2b;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bw6NrwIx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=; b=FyrTDV2bNdnD2W
	+7PsO822Efth56BWaWVrqAWVKiCE456cXkx8Ip2VDIwgVGTpbnQNoTfbL2sRh5IuxsFsXZEBeS0F0
	G0zxySIxsU9hD4FSu9Po8qxliMJ6q/S54h0wXpuQCWKKcqkXN0PFuGk5FH25l1ijdDBaai33p3FFS
	y+eLkKRASkeMSnChmNVe8OOpvuAaBp1cN1IMUhl6r4E2yMnG7xpYLimAdUadg3xyIxjfiXtUqlvqM
	vn5d8lQGYNvQ55+xkiK2CSAPlexGlqB3mHuQUItOhdkHtdvzHVvNMJ8YHB5j5WhIpQXWk4RsCscqT
	Hkp/8cCo44BTd4T0vqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4XC-0000000FI5D-1Hm2;
	Sat, 14 Nov 2026 03:34:34 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4X8-0000000FI46-2iyw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:34:32 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3b1d1d74384so44529a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627270; x=1795232070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
        b=ooKBuO2PupBv/TTEz7I3q4l180ORZuBiHRbm6qE++ckSrhlgP6vKNrDB1kdX7FTOoL
         9F35KlIlK+QdU7ihwQ/YIBvfr/fg/tIM9t+gVbdABqeZ6ZycCjTVmsFjJrJfpdGy1Qml
         UV5jYJZEWygeCPYhz62EFMcH8AiHg6edjzKNIbJjURpTcseoKq4BuUBWxFMbG9EnTsdl
         ujHt3gZlOfCq5bLWRKbOBH4xMACndm2lGBwgN+p6o8swkDMQBSuMY0ESw0I/kK2S8b1S
         jlVGAuwDJscP+/+ziMh7bBX/I/8kF9c8l6ZqfgPK0jT+JnHyiFJfyHiYlSUNxRmDlcjk
         EpFg==
X-Forwarded-Encrypted: i=1; AL+hErH2oUjOi9lHVpDcLNocGBTqT976kDjQsjQlNN6z5NQtfnch7zQgi01Q60H9qjEiYSHcRaQSw/QGamhkUKwJXtKa@lists.infradead.org
X-Gm-Message-State: APuU4Z/WUM4lMaJXTrHsyTceMIrMPzlz25vx7LbjkzACRbUR5Nsr/q6I
	PrOW51WWr2VeFdn17oTJYEnWMX/h7/X2AYqHEA5Cp3RycPH6bQk3DudnIEB4GDCJ/RrysL6j10E
	07vn1SzP7hc9S6fVQVF0Jl1gGhKUEooRWOFjLICVQgHlxjdcXs6LWM9u3NmQQ368AvqURJ99ijJ
	2SNI9i8pXQ5MdnTon9WelYBFzVU2yW9v+bi143XcLsl1WufPjaBuUoRQiegDtWF4yUp4hgWj/vK
	zjUu8sin8yrBXVdl6jRySEvcZpJOqNxCN0=
X-Gm-Gg: AYBFou1YkQCV6XBW1kTygF4qvBZM9aw40/Gie0f5f7loPtT+zv0FKPSqMbq1YNziljp
	vNWPs0Bi4W29VcOkxtim4GwkZ6T75r3ipctS5Sih0V9LOYED9iTsVI5PkGdlTUMaCHIpaftvTuC
	tsr4ave10g9ix+DHnramxGn5gycZ2bkkZLbrY7nBUH1yyqoo9smyOk5p8ytkEYIWWlZsHIy/nCq
	YoVA1e7GnGsK4xyE1nGbRidQuqzEwsYcoXF8tVPPyOQXhos80vyaMcSknPOqnl2IHWEjS6vpHZl
	TMjSJ5z5vkLQFVhMJNuhJIivqqPBrr7Ao1dlT6tRpW9HhGbiknf28HuTIdg2TNjzqQFMAEhu600
	kkVQ1p2fdgE4qwVhL8HCgJLV5cXF7LrnBVlJ7qq2af4y2UfwesY/8A56agvyZmrMHjAh2sIb7x9
	yc7xaYzDe77hpnBJoSRSyX4/E8Y5H0Pc3JGDmekNXh
X-Received: by 2002:a17:90b:4d0b:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b1b089e039mr4591128a91.1.1794627269798;
        Fri, 13 Nov 2026 19:34:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b24cf7ecsm3089649a91.2.2026.11.13.19.34.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:34:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso7021732eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627268; x=1795232068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
        b=bw6NrwIxHJQ3f8OIqqPBgq1G/gdnpI/a7hHlt8DdmpfHhg21tuIke/XprFgE4yWT5f
         +lG4Rg8SwE6ciqR+WqL+9zV9l//vUvkg9Nnxq1JRODF9V4Vb+PfMwN1G8EDYZ6QBd/Xr
         V6RrhEAg11Zyunk1Plj4PvdFR9z2TuRkScQ10=
X-Forwarded-Encrypted: i=1; AL+hErHWtRMUGi28/aboxCcxCtcA3m8i2z5naihHwsEgyO6TRAVLbUvoeHyqLO4pPtWzx6Rsi3JP4XrI7YuMvPtNqC1u@lists.infradead.org
X-Received: by 2002:a05:7300:269b:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-37acafac54amr1253756eec.33.1794627268060;
        Fri, 13 Nov 2026 19:34:28 -0800 (PST)
X-Received: by 2002:a05:7300:269b:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-37acafac54amr1253710eec.33.1794627267158;
        Fri, 13 Nov 2026 19:34:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm12865283eec.28.2026.11.13.19.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:34:26 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	netdev@vger.kernel.org,
	James Clark <jjc@jclark.com>
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its clock
Date: Fri, 13 Nov 2026 19:34:25 -0800
Message-ID: <20261114033425.876398-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de> <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_193430_698416_828914E3 
X-CRM114-Status: GOOD (  10.88  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 20 Oct 2026 16:58:11 +0200, Nicolai Buchwitz <nb@tipi-net.de> wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

