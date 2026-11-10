Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E7606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hptM1gGz;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=hB/AKAmC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FnUITX5l0rY4dD1guY4U8vouradcFBCyDlI8pSLx4qA=; b=hptM1gGzRIVIGZQ1pizWMu46Qr
	utUhWsIJetLKWfRvads15p620Ie2WqrO8yae9i/V5uv9jrl03meU6uzV2Ip69VCtlYl2mRI4FTmgK
	XaDS3DVxIYKN5U/KrDGVwS/zy7N/bG9xqLduPK7tZQBndND9qbC9zUe0O+8rmLOCJcF7nVukWIxqj
	lzs0Zra6ofZClntTvDeQSPsdj17r2IVyZ/quu6FLq9d7FSxZHn4bowf3tlR1TcwMjtcDKvPdGT0Vj
	pWC1jrl86uKYrJft6IgH9qcVBKhavY9qr8BERcpUzhE/MlUWg6e7qxxdj2BCJA+tN4hMq3dFKgerl
	teUJPJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfxo-00000002kD4-1wjX;
	Tue, 10 Nov 2026 07:08:16 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfxj-00000002kAR-3zyA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=hB/AKAmCgJs7B3DDEy0Xbs2GVhGPu8UdOkasORU5pazMojtjlJwxYEF55kIY2vn9whzYsl0VGuRB1
	 5oQHA99JMNQijU2vzjZgeyexa4JXbZU/9a10LhOC5yd+RMT2GrIKMfDYGb8/6/LQF9TLDcbX/PNNr6
	 MJ8ZSgEpkEs9fvc8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af2c2d11b0-d148a;
	Tue, 10 Nov 2026 15:08:07 +0800 (CST)
X-RM-TRANSID: 2ee96af2c2d11b0-d148a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af2c2d35b4-ab420;
	Tue, 10 Nov 2026 15:08:07 +0800 (CST)
X-RM-TRANSID: 2ee16af2c2d35b4-ab420
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 0/2] net: ixp4xx: fix OF node leaks
Date: Tue, 10 Nov 2026 15:08:00 +0800
Message-ID: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230812_591730_C4F08AFD 
X-CRM114-Status: UNSURE (   4.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

ixp4xx_eth and ixp4xx_hss resolve their NPE and queue phandles with
of_parse_phandle_with_fixed_args(), which takes a reference on the
resolved device node.  Neither driver ever drops that reference, so
the NPE and queue manager device nodes are leaked on every probe
(and on every -EPROBE_DEFER retry in the ixp4xx_eth case, as the MDIO
check happens after the DT parsing).

This addresses part of the "bunch of pre-existing bugs in the area"
noted when a related probe deferral patch was set aside earlier [1].

[1] https://lore.kernel.org/netdev/20260831170858.7e23643e@kernel.org/



