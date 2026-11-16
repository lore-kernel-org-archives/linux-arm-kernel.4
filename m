Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC8A606A880
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1rThQqKr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=GRq6dFG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ooe8aVYLhVyQjDTdzZYaM/OancGDo6HyHA7XUTxSDaQ=; b=1rThQqKr0gmOB3
	62XqIiXJk27vVXijfQe5Sm5dwgJWcuQtpwh47wAFR04pSMNRB++FQbXJ8vyrjBqjAKeJTY5Lx2Uxf
	VTURcVswLE6A/JtgZByjI6nukKlulj9ozT+spQRKoyzCJgzGOvn1r5woOGZXJI/4B7OD94ZGqwB5o
	kWiiwYkhSCf68jUkg+n+BtRDqVUnyDCcQVjqcjz2z8Tm1rPhYZ16btJkNVKHZTQDDjbQjnmdwm6Yz
	NWws6hwjfeCpluoiWV6DUgXHrBBKkhlgVeokh6zwZ171XdwaGECtuuaQzetmld361Fcry/CknrGfd
	L5pDTLGM+drGn1VnFkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT6Q2-00000004CNp-3veR;
	Mon, 16 Nov 2026 23:47:26 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT6Q0-00000004CMy-2Hoy;
	Mon, 16 Nov 2026 23:47:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794872819; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=inej4tXdDNrbwI2iLCdbbKghn7L/mpBlzz30MhNPRZ812lEI9uMjBvRjAa9/YbL10wNQS5T//czPLmXuRb4eTxAZd6knCzW/u6eZ6ZZepfi+LC05dooeVn84EiFE0kqSzNEAGioW+vBEB50cUdGlL9XfygKPRqDUwAzExMn2iEI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794872819; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ooe8aVYLhVyQjDTdzZYaM/OancGDo6HyHA7XUTxSDaQ=; 
	b=JvhAMGsKmhDokRhKissokzoD2UuEbmCLuOweMxg+UqTmANFbSGwDnLv0v44Q/eHTrngXGPUfX1U83BhjiBupOPT+aI5e/O/HD6u3ajaouNQ1wQP1a1Kq40JA/ypv+ES3nRQTCOUHZYUO02EBTzfLztbUW9yzY9n84cuZoEC0FXE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=GRq6dFG5MWvsX9lB2vV85LdCvyLwCnVGbM5hs2ybm7+Go8RGSTbckgzGtSuxw9oCgmw0VByn6VpplVRgfHxmV34jacX2mlFI6m6bg4eeoBAbgPCpmUWu1paoGL7TQI2f6+NLFzMRKdjZT7wg4KbBV9Moi+T1WmP6+HIo1+UFikw=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Ooe8aVYLhVyQjDTdzZYaM/OancGDo6HyHA7XUTxSDaQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794872817568586.021810184602;
	Tue, 17 Nov 2026 00:46:57 +0100 (CET)
Date: Tue, 17 Nov 2026 01:46:56 +0200
From: Igor Velkov <iav@iav.lv>
To: netdev-bot+sashiko@kernel.org
Cc: iav@iav.lv, andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: mdio: mux-meson-g12a: keep the MAC data path when switching MDIO
Message-ID: <20261117-re-sashiko-g12a-mux-v1@iav.lv>
In-Reply-To: <179485704584.3136.17355463997361048256@kernel.org>
References: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv> <179485704584.3136.17355463997361048256@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_154724_860801_D1DA8C4A 
X-CRM114-Status: UNSURE (   2.75  )
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

Right, the check missed the deprecated phy and phy-device references.
v2 looks the PHY up with fwnode_get_phy_node(), as stmmac does.

pw-bot: cr

