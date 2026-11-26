Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mtiaslfk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.a=rsa-sha256 header.s=default header.b=nwp5dRKO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OL55ImhmBp8fM3GmtTJh4abvR8DngDWjBaxkdBPdVd4=; b=mtiaslfkd0MIWq
	r0+MB8usteG2VVhAMp3b9kTBQtNXbiOCg967PRr//h2a22BIPD99QEIVXIi+ehNHozlIpt8omXQbo
	sPyO7UF5BLZGoAhiTyK2wTof6RC/bQy5kfpsHlG/2H5A+GghxvjT6D9XrHAgCDRB+Cn25MzlrWdbo
	cqSu4S2vXCSuy+QE1evVVRm4QmRAKUWEZPTEVRuONxA+NpzL6WLar9tWloEF202SErtJHJpZ1i120
	mGsWbpZl/Evjdsk1TYK4S5C0Es710qNRiDGpQ5QXBjzl8O6PZ4g5Y5Ceu0DNNow4LK0Bea9GMXoJj
	BvYKmWKHB7/o73BPn2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUNi-0000000CKtS-2dJq;
	Thu, 26 Nov 2026 07:59:02 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUNJ-0000000CKkU-1IKz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OL55ImhmBp8fM3GmtTJh4abvR8DngDWjBaxkdBPdVd4=; b=nwp5dRKO66yTK8q8ECx+Hss6gR
	Gb5sQd4FVRKNmpYhornibguhcZfjq7q+x3ON4pWXWp2E1hWMqqzGZgnZdZSyEt48NTl1y8rdRdroa
	enOgPraTh0VzQy8qRl7TclLb/QQAKIMRb2Zen1eeGCgCfQljBNHgTUrYv3G2aK42WIbwB0k5I9krI
	CcwSKKY+4MisKcGWnWR2WyIkXeQMRpVwod3JAaIRYK/DXQDWDF73AHva/0mDDAb8aQeQ90BHCQyjA
	zvE35tDVQA7NiOI0VoZrjus4TGVwz8A0dulZ5AiNRfI9VrV+M9VeMN15Vcqb5f3fDa6+yS18OyBiA
	EukEQ0Vg==;
Received: from [115.246.246.98] (port=29389 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <parvathi@couthit.com>)
	id 1xWUMd-00000006r09-1PG2;
	Thu, 26 Nov 2026 02:57:55 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 0B64D1B80119;
	Thu, 26 Nov 2026 13:27:52 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id WNNHpjXhAkh1; Thu, 26 Nov 2026 13:27:50 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id C74591B80167;
	Thu, 26 Nov 2026 13:27:50 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id O-RUpmCoObAk; Thu, 26 Nov 2026 13:27:50 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id AD86F1B80119;
	Thu, 26 Nov 2026 13:27:50 +0530 (IST)
Date: Thu, 26 Nov 2026 13:27:50 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: MD Danish Anwar <danishanwar@ti.com>, Parvathi Pudi <parvathi@couthit.com>, 
	Roger Quadros <rogerq@kernel.org>, 
	Mohan Reddy Putluru <pmohan@couthit.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1112845239.887064.1795679870638.JavaMail.zimbra@couthit.local>
In-Reply-To: <confirmed-20261105-26-ee6bb3813c44@gmail.com>
References: <confirmed-20261105-26-ee6bb3813c44@gmail.com>
Subject: Re: [PATCH net] net: ti: icssm-prueth: Retain port node references
 until remove
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC148 (Mac)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: Retain port node references until remove
Thread-Index: SGID6YUxBG5lHjcZ6qjhdNoL9iQyXg==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_235837_394049_7EE4C387 
X-CRM114-Status: GOOD (  10.89  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

> icssm_prueth_probe() takes a reference to each available port node and
> stores the nodes in prueth->eth_node[]. Those references are released
> both at the end of a successful probe and in icssm_prueth_remove(), leaving
> one excess put per port after unbinding the driver.
> 
> Keep the references after a successful probe, since the stored nodes are
> used during teardown. The existing remove path and probe error path then
> each release the references only when they own them.
> 
> Fixes: 511f6c1ae093 ("net: ti: icssm-prueth: Adds ICSSM Ethernet driver")
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> AI assistance was used for analysis and patch preparation.
> 
> Based on next-20261104 (8b7179210b22).
> Compile-tested: arm64, GCC 14.2.0, W=1,
> drivers/net/ethernet/ti/icssm/icssm_prueth.o;
> baseline and patched objects built with no warnings.
> Static source review; no hardware, boot, or KASAN test was performed.
> 
> drivers/net/ethernet/ti/icssm/icssm_prueth.c | 4 ----
> 1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index
> b42c98e861e081d6c616881786b94e8bcde6b944..4f9529e0e404fd9cfee9e7340f2f048442ab938a
> 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> @@ -2018,10 +2018,6 @@ static int icssm_prueth_probe(struct platform_device
> *pdev)
> 	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
> 		 (!eth0_node || !eth1_node) ? "single" : "dual");
> 
> -	if (eth1_node)
> -		of_node_put(eth1_node);
> -	if (eth0_node)
> -		of_node_put(eth0_node);
> 	return 0;
> 
> netdev_unregister:
> 
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4

Reviewed-by: Parvathi Pudi <parvathi@couthit.com>

Thanks and Regards,
Parvathi.

