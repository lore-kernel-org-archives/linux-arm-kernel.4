Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E0606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OrXt9b11;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HiZg3/+C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kluHAf30lOQTvYGq+YH2c2fBsSTyc5d5qn0rYtZKUsw=; b=OrXt9b11DJAM52
	L/SRmT8//tG6XQDjFwlxIG9A32OCsfBQyGUDSiKTNpFwDP7IdoOtlx9vXUWdVeZF7dEmy52yxhLtw
	djKJabWU1lMoVNbEIQHpLOZm5hx/Sd5wyQudI3qx6BlGSwIdlq3fYadd/AH3N3aKcjAQMp64CGLod
	NZg/kgvvj8WEuIBsKnAkqvxgt2vRX4g+UPitZhnlYVt+YBpwW/Jq9j0BuOLXkVw2snS00be0qE+WM
	+L8QBGjEIE42YMq6SjiuoKJY9jI8AsjqSbzyvWHvzR5Npi5/iH/BrajJbEEuUnrBPzROk1wmLodQT
	OYI+8D/vQ9by6xhhy3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRo1c-0000000CH8X-0S6s;
	Fri, 13 Nov 2026 09:56:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRo1W-0000000CH7l-1eA3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:56:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so4994915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 01:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563804; x=1795168604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kluHAf30lOQTvYGq+YH2c2fBsSTyc5d5qn0rYtZKUsw=;
        b=HiZg3/+CMOxyWBFw3Zt0NmVsAKiqsXQ8q0/xhb1TmgYKEjnH6aMPd4eFSl1VGPrO9V
         WmEN5JQyDp9YQkj0Udt+CaHT72Jx1wc/4Fq4dsFgqPoEydvLURpf4Bf0FTn8XqE5WD0t
         k0CMVVEjPWZcnYPqQBRPtCkfLKYIh+CNCRGWVk3b1ohLOf5y2lW0ttqL4xyJwhEdhCxX
         w8/CEXPcmxqYXTplNq8/Wyap2kgjDI/9jxk1MOo9pwROXbL77Fjogwnf6eJdGCB6NRbt
         aOlkkKJr9p8BSV9Cpo1rb3d1rXbMUuuaZcsnUuIJAy0k0LT/XlrdZc2XfHoS6XC7SZjB
         DlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563804; x=1795168604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kluHAf30lOQTvYGq+YH2c2fBsSTyc5d5qn0rYtZKUsw=;
        b=rfFUJ9vR9HdxUDhqNiwRuckzt6/tjkn9HLLpTD0j58m7FZ37o8O8AvA6VlVQV54INA
         aXDPfwnuWbp3ywWIyP2qQCKIMuAyR4tpCATuZKibXcNByQdpdGfvI+bYnuyOQk7xaUE3
         rtiF2FOjrnnpLGYLajcayFu7BB1zps4hNurMRjEyIMzx/LFSlTjalWomnJcTR9EkZaQr
         2t4jI6amVlmSpKVNONnsGsmu+qPvw2knJ31pukxXxIZebeVLgUvHMAj048nEo0mhYAfE
         VZryUIh//WZRUvQkp0QKUepXZOow/leu6yJCSWNTVtmuNfU4AcSNxr6bpAseTxda5dlu
         AG+w==
X-Gm-Message-State: APuU4Z+WMqL7XQX4lRcS2wnUdbkKIKtFB7GFoOOaL7bQ0PL4ELxWkZsv
	XFznlBQe6YoVDg/78TBMTfUe4RTaB0bF99tmEnrm1mxmaq9Nqj5iVe3P
X-Gm-Gg: AYBFou2stjaDhRWNUwWDSwiYjc4RTQjd3uJolf4d+1fgGhY+G/fjl9Ia0w8aTSTEaSx
	0kFuOHcT2DMsQ5KLIT57kvoHKxWjywYCRa6HnD6m5oqlE1lV4AVmiicxf2+OhwXSmxRIs12rX3B
	j8/FFInub9NXJuIZWyNF4jeYwIv40cq5CcFLVTEMAh2I2Q2Wlt9X4VU7FrFJbVRh3oOpWALYbXi
	cykSvB3rUi5Zy39vhH9McX6HKteCalZ+dBw8dlkNlDiHQ0rfa7UL+ztWl7aq9AlFNJD8pjnA6/J
	yscEkpqUwrk2JDqed89XNM6QnqE9kkFmeQSq0lyM9uXZmE0lVCD9aavJw0I6jkFx3asz1c+3kU/
	xBKOurSTBoysXLJfafckIcrMNxp7ptoso1ADx9y+zZd/xb4SwI8xOH2RcLfhYOOFPJDwKsV1h8f
	aMYpaY0q46ltEDSZoTimvwG1ojpvh1z0J1HvbIcjxszyF49CWMWtjs1zlmia8TL7k2AkuqOHOPc
	v9c0k/8gxcOnIu3mK343xHXbTi9qYyrZmODWMgRCt7KqrG6MnID150XfzJIoKijs6aQy273Mbqa
	9zdhwMWYarKWK7dWwQSApEMx9q3zQYi/tMrXo6rl7DT+qKlnhO+V0IxPZTXl1XeEtMPbe3PwDmv
	gpvZGcxdeKGIL3iifNBD+NBbrbsC1E+b/MNZ+Vqci93c165izpWBtyxD5fMOCAIZf6ex9IiKxYe
	qF//dbrCKEPQmaOgcY
X-Received: by 2002:a05:600c:6286:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb55a5d634mr37035575e9.5.1794563804181;
        Fri, 13 Nov 2026 01:56:44 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm28500015e9.3.2026.11.13.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:56:43 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 16/24] net: phy: Add Sanechips ZX5201 PHY support
Date: Fri, 13 Nov 2026 09:56:39 +0000
Message-ID: <20261113095639.1667143-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <95e7fc97-2bd1-4b68-a9ef-246302ed9ec7@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-17-ghahramani.navid@gmail.com> <788c9b01-473e-4c45-b6f0-b2ba054da8e9@lunn.ch> <20261113003655.3665572-1-ghahramani.navid@gmail.com> <95e7fc97-2bd1-4b68-a9ef-246302ed9ec7@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_015646_686234_1043B545 
X-CRM114-Status: GOOD (  10.78  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Andrew Lunn wrote:
> https://www.sanechips.com.cn/en/Products/WiredEn/fixedNetworkTerminalEn/1558027080778723330.html
>
> This says it is RGMII.

Thanks for the links, that settles it. I will treat the link to the
ZX5201 as RGMII.

> So picking SERDES is probably causing some of this confusion. SERDES
> implies there is a PCS, and the PCS is doing signalling for SGMII or
> 1000BaseX. With RGMII, none of that exists. The registers might be
> controlling clocks, or regulators etc.

Makes sense. I will drop the SerDes name for those registers, work out
what they really control and where the RGMII delays are set, before
the networking patches go out again.

Best regards,
Navid

