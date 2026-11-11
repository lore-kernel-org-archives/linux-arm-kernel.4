Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC483606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W7A5AZIz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=AFkFNMTq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jGvFpDsz598JX1tRXTqbNVLCtafK4G/dmHbNByWRzkY=; b=W7A5AZIzLO98kt
	z5Bwx8k0CLKn3Cx6UWILB32IE2yqEATj0JBqa1CyHSdWAkLCwkLJkaPuoVwtjfxfE7Zru1VoZgftv
	+ZNqbakPTNM0ld73RMbigT32Ok6R6DGmnLFFOedlsHb6q7s8SNI8kSe6JMJF/GokjPUg6PzapwP8n
	1Q2X3G6k/ynbcIZjo1WOHrs8sMFR6Srht9ECV5F6HZDRJMOMtvmZDNkfwPQ43OaAWgMqrD6Alll+f
	rBYGPwXOpUyMZ5L7GsD1ZXWqDTZzj4eyNf6CSt3bkkF4cxQjTDaObjL0bW9z2Cj13GibqwCtNuBwz
	Na9ZfBfoLbA4yN2wyyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRI8r-00000008By2-0cGl;
	Wed, 11 Nov 2026 23:54:13 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRI8o-00000008Bxd-1h16;
	Wed, 11 Nov 2026 23:54:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794441206; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=e7RVnaCvhoD/9oippd2IGtyP6w2g50/JUyV/VOGPkmXC47tOZmMwknBiCYeh5+/2prSpPVCGBP/JoxTjhJi2k2mjOSJ753yHsK5WqGbVxt2goc+D1vijFtaYKhLxbE1p8m5xBQp87Rnw9ds+dl2kkAb1hpuWypmj1qRmqZj7g/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794441206; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jGvFpDsz598JX1tRXTqbNVLCtafK4G/dmHbNByWRzkY=; 
	b=fKLp95xd/xUni1BBl97Ctd3K61CcUKlqKeuWO0vpkstuiMUIqGsZXXA5TMxyT2reYJVsRDMBOGQQtIEj3rNpVbFugHemuCeaQKhwIElciH6r9ileWALhO6sTRHtmLFotiB6aU+SWyGxfnc4GAlCo1udWnNPgli6brRNZacDqT84=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=AFkFNMTqWkB5Dz0mtDydGaCnJEop9b9YsAr3K8AAmmJWZRVdS/yxYRdJr9IVl7V7lKlbnAaf7mMciL+G1F6Kl4RvwRQnFDd5QbM/zUI7DMFaoWzC4HbKPdpgUa3qe3zEVDyoSR5/6ozJnsWAoHjWQXefrTCbODLE5Kt/hY+7aKA=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=jGvFpDsz598JX1tRXTqbNVLCtafK4G/dmHbNByWRzkY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 179444120369778.37346185581566;
	Thu, 12 Nov 2026 00:53:23 +0100 (CET)
Date: Thu, 12 Nov 2026 01:53:21 +0200
From: Igor Velkov <iav@iav.lv>
To: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Cc: Igor Velkov <iav@iav.lv>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Lukas Wunner <lukas@wunner.de>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Wei Fang <wei.fang@nxp.com>,
 Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Doug Berger <opendmb@gmail.com>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 0/4] net: phy: postpone PHY interrupts during sleep
 with MAC-managed PM
In-Reply-To: <20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3@iav.lv>
References: <20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3@iav.lv>
Message-ID: <20261112-phylib-v5-haoning-retest-1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_155410_716338_D1EEB731 
X-CRM114-Status: UNSURE (   5.63  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Haoning,

Thanks for testing v4. v5 changes patches 2-4 (freeing the interrupt,
a failed resume, the wakeup policy for MAC-managed PHYs), so I kept your
Tested-by on patch 1 only. Could you rerun your fec tests on v5?

Igor

