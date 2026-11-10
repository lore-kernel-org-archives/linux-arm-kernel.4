Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458F4606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rLNqDSwc;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ku6oRIVn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5Jm8CmWCS+409DVRpY2+DlWVRbEH4X3VIeQI4VAZvY8=; b=rLNqDSwcWfTsMDfiByQwVii4Nx
	Vc5NLvVG+vUvHI+SDPYYXHexzleyWt9cNz4khEHHFe+j0oVBXh4MWOQG48tvqbxfy1VTccXC2y+6G
	aKKgM54LIQ4XAzoTnOhCyHoFD2d0bqj7lfY9D/Sw/KNGx7MPG8TO1t6pU3QFJO4cWyPj+eMWGaSWY
	scaQtIbvc8rnZ+yno2rMKj0dyhRaQDmdxveZR7BkftUAVNuA0mUaQm9YfAXvbOUlfp7pJE8VWi9En
	1fu40KvSPNqY0WINte68rqceiG29WT1kjtt5mhY/DkUawFtBcHpifHIZXEkRVKrlyWDJaKoK8kKWj
	h8PeCz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfYG-00000002gpD-0mSr;
	Tue, 10 Nov 2026 06:41:52 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfY2-00000002gbZ-2pzR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ku6oRIVnWj9CiJzoeVUSods1NYk5PStssoE5vzfE/94wBRvbZU9U/LKZuztZFb3d4CoEJGxsXeex0
	 fi4hG6owCWLzigAK0gOIR+jXie0EtGUG7V9NoiC2FnNYyX3neTVQ9m1YWD3ngguXAIobpsuV0mTG3T
	 72aoJ/1MlR0yPby8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af2bc9083d-983dc;
	Tue, 10 Nov 2026 14:41:21 +0800 (CST)
X-RM-TRANSID: 2ee66af2bc9083d-983dc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af2bc8e8a1-aa5cb;
	Tue, 10 Nov 2026 14:41:20 +0800 (CST)
X-RM-TRANSID: 2ee66af2bc8e8a1-aa5cb
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	jan.kiszka@siemens.com,
	diogo.ivo@siemens.com,
	haokexin@gmail.com,
	horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2 net 0/4] net: ti: icssg: Fix device_node handling in prueth_probe()
Date: Tue, 10 Nov 2026 14:41:13 +0800
Message-ID: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224139_963323_9095B420 
X-CRM114-Status: UNSURE (   8.70  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This series fixes the device_node handling in prueth_probe() of both
ICSSG drivers.

Patches 1 and 2, carried over from v1 unchanged, fix a device_node
refcount leak on the "ti,mii-g-rt" and "ti,mii-rt" syscon lookup
failure paths. Patches 3 and 4 fix the port scan loop that is shared
by both drivers: a port whose reg property cannot be read is skipped
instead of being routed based on the uninitialized value, the node
reference is taken only for a port that is actually accepted so an
out-of-range reg value no longer leaks it, duplicate reg values are
rejected, which is what the existing "port0 and port1 can't have
same reg" check intended but never caught, and that unreachable
check is dropped.

Thanks to Simon Horman for the review of v1 [1][2] and for suggesting
to collect the fixes into one series.

Changes in v2:

- Collect the two independent fixes into one series (suggested by
  Simon Horman).

- Add the port scan fixes for both drivers.

[1] https://lore.kernel.org/netdev/20261109165235.GR18859@horms.kernel.org/
[2] https://lore.kernel.org/netdev/20261109170036.GT18859@horms.kernel.org/

Xiangwu Lai (4):
  net: ti: icssg-prueth: Fix device_node refcount leak in prueth_probe()
  net: ti: icssg-prueth-sr1: Fix device_node refcount leak in
    prueth_probe()
  net: ti: icssg-prueth: Fix port scan issues in prueth_probe()
  net: ti: icssg-prueth-sr1: Fix port scan issues in prueth_probe()

 drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 32 +++++++++++--------
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  | 32 +++++++++++--------
 2 files changed, 38 insertions(+), 26 deletions(-)

-- 
2.50.1.windows.1




