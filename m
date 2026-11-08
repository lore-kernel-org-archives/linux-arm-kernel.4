Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XUxOj0Ci;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=AQvmD1Yz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vh/9TrYwU99E4PCgRdKtI1GiSkx+bWoa8oDdIzOoHTQ=; b=XUxOj0CiwViOwAn1MbpXYV1nL2
	/cmc78NnbuNdq9w5pHt0LxI07LWEuoSbFvxW9w4KJrJS+T5h85mSNbcWdAJrCLg/b3l0nKYWQshgw
	JhqmzkNynVSK0gPWL2l7V7Z7gPBIPqZ7G3+/mOH4uSFrDm/4uHsCLDMnaMCWyOO5uy7xGUikO+A/A
	jyYHlZvudSCXfITrYRtyCSHdN1368PNGSsI2Z8HdNW2Ja2s8v5Jd4nqa3vzVyXbxznn4c2x+18As/
	kwY7k30m8ONiNw6t2FxynzakWdm+h93pQ8XGMu1cXFeF9CV/zvh7hB2830snZb52OjCbqJf60xoiS
	NkqApijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8R3-0000000GVzq-3463;
	Sun, 08 Nov 2026 19:20:13 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8R0-0000000GVzJ-3vIR;
	Sun, 08 Nov 2026 19:20:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794165599; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=H1luY180cpXtbO29I367UMSNTK6y0KyF55ZvVdEna/3s7vvoWRNa7gHyBt/xypqZZMGVuk/EmUAtcvUHPvvAWQR/1veMMrR6PWvpshYeipulwQ+jpW//C7+R5QwUlYj3RD0wLQISLwxIHf96zyiqGdkZJ0JXcdkCXADBJR872f0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794165599; h=Cc:Cc:Date:Date:From:From:In-Reply-To:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Vh/9TrYwU99E4PCgRdKtI1GiSkx+bWoa8oDdIzOoHTQ=; 
	b=au8oB9kOxtxGgufNSqVsCnUYGolNFTIKo4ZiWBNef9t72FTe4VNMUnBb+pIBI3iQhhAQSFyokmTJELFAp2MAF1HgtJUdAzV2q7zJJNMtUl4ZowfcpI3tKDblRcs3NxoYfLPPyRPdC+1CkkYyniDyRUC/Nep1cL4TUAw8kii+zOw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=AQvmD1YzyKqMNB5XrsP9jMBdwMKIHBOezeGPp3sqpeiPnayjypwvDzH7sur3GtV1X6v7SR5FPmrMmzjnMigJuSpl6Pgh8B08Fvjq/VZh31AShvhBxrkeWGdkoM2lS/w3nbUwkJBv32S1IY4AQU8omKjuSlNVa/qo7yl4iSylw3U=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Vh/9TrYwU99E4PCgRdKtI1GiSkx+bWoa8oDdIzOoHTQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794165597779665.0347627600589;
	Sun, 8 Nov 2026 20:19:57 +0100 (CET)
Date: Sun, 08 Nov 2026 21:19:56 +0200
From: Igor Velkov <iav@iav.lv>
To: Heiko Stuebner <heiko@sntech.de>
Cc: iav@iav.lv, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jianqun Xu <jay.xu@rock-chips.com>, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: rockchip: restore the bank registers after hibernation
Message-ID: <20261108-re-v2-gpio-rockchip-hib-dbclk@iav.lv>
In-Reply-To: <20261108-b4-gpio-rockchip-hib-v2-1-27d3d510cb73@iav.lv>
References: <20261108-b4-gpio-rockchip-hib-v2-1-27d3d510cb73@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_112011_254813_2E7C03C9 
X-CRM114-Status: UNSURE (   5.37  )
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
X-Archived-By: <archiver.kernel.org>

Hi Heiko,

Please hold v2: Sashiko is right about the debounce clock. On ODROID-M1,
after hybrid sleep with a power cut, a line with debounce saw 0/8 edges
and a control line without debounce 8/8 (one run). dbclk_gpio3 and its
parent dbclk_gpio read enable count 1 with the hardware gate closed;
opening both by hand gave 8/8.

With WoL on, aclk_gmac0 and pclk_gmac0 come back the same way and the
network stays down after restore. So this looks wider than GPIO, and
fixing it per driver looks like the wrong level.

Should the Rockchip clock driver write its gates back after restore, as
at91, tegra210 and ti do through clk_restore_context()? I find no
restore_context in drivers/clk/rockchip.

Igor

