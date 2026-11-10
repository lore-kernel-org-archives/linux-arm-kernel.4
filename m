Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D36606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yONl8Jyd;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jORdYAtT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bDtILV99THZP4Ptw4aE3mDtOcJSMnQXEODVTmpcW9Nk=; b=yONl8JydCT76WO
	yWl5/MyF/J55yHn6lP+KDn5QzJ/Y34jpt+/vkZRb9VrUyhFZmEPG+zIEMLWL80Xzo0X3dNUjxJ8Oe
	leGkemHi15x4kT2g3ZjZ+fWrU2E46EuashW0QdPWbwZAd85e1u8+rtZw9kLrxz30RNZ6FmUV2qCsz
	NnzTnWkhVxm351hn3xA2Thf5jiw0J+PhdjVTq7eRmiwdcIr6Jp0WqoAMSydtOUkTlM40+cL40aWQ0
	ZJFEeLi1BN3mq/Qnao986THFkjl5T4MSGGGo/mdARIb1RomTAHkHuYjF2v9CFpunCSdlDuaP4NLBB
	OiNTjZKs/YcPDpRLGgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQblC-00000002BbP-21Ae;
	Tue, 10 Nov 2026 02:38:58 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbl5-00000002BY5-08s9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 02:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jORdYAtT+f+bd+o7EXeeJbohiIM42LB52YWbvvzRv9+q0NveaINzb0ODH2Puei5G/zi3vtLcgqlwx
	 rlU0i97e/esfIY+S2RZ4D0V9X9lQBBE4D9PM1q0SaFGRYWAnbwWBWbW0YvuR6SfKd5j+fYqLnTPqzL
	 ZN0Dfa95aR2gDE7A=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af283b45d0-696bc;
	Tue, 10 Nov 2026 10:38:47 +0800 (CST)
X-RM-TRANSID: 2ee86af283b45d0-696bc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af283b5717-a33b1;
	Tue, 10 Nov 2026 10:38:46 +0800 (CST)
X-RM-TRANSID: 2ee86af283b5717-a33b1
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Simon Horman <horms@kernel.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Diogo Ivo <diogo.ivo@siemens.com>,
	Haokexin <haokexin@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ti: icssg-prueth-sr1: Fix device_node refcount leak in prueth_probe()
Date: Tue, 10 Nov 2026 10:38:44 +0800
Message-ID: <20261110103500.3142-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261109170036.GT18859@horms.kernel.org>
References: <20261109170036.GT18859@horms.kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_183851_621077_346DC62A 
X-CRM114-Status: UNSURE (   7.24  )
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

Hi Simon,

Thanks for the feedback.

The SR1.0 driver shares the same port scan loop and the same checks
that follow it, so the same analysis applies: the
eth0_node == eth1_node comparison is dead code for the same reason,
the uninitialised reg value is used when of_property_read_u32()
fails, and the loop can leak references both on duplicate reg
values and on out-of-range ones.

I will fold this fix into the same v2 series as the icssg-prueth
fix, as you suggested, and the port scan loop clean-up will cover
both drivers too.

Best regards,
Xiangwu Lai



