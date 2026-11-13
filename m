Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72C0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WyZnJDLa;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HJwlG4E6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OcFZyRCHxUEqKuCrnuLVw2WXrhaiDJIvI4rfzQ4KjKc=; b=WyZnJDLaemGUwZ
	R3+zDUVum38IZGNubmySwXa9VxNIZKWXuRExTt/eBvGIgloqlVsbDM0ml12MoLU7/q8xUpY9ZVfrL
	dNm0fuqgR4lqjX6UVl9N7rAklS46c4BBSdJ2EZpJQ81Qzco6xwHA3jAdH8d4xLaFbw5ELr0gZM+XD
	RGkc5JjjBeWksJTbz7RbeuLpUzRBeKdLoXR7n7u/nebLvZTxdVdeXpu2RO+MAlpVqEdIxiZUQ5hQf
	BIfTGtJ57CWbhG9p52uttXfkoWHGTnCRIJEOMaeCoecfct+cEoK2hKoHfIErLKxmlrbgEmReozBy3
	aK6tXDlGMaad0bM0ZniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRody-0000000COD8-1B9Z;
	Fri, 13 Nov 2026 10:36:30 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRodq-0000000COBH-1gdG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=HJwlG4E6ji6KSkhh4JKiIOCaRWGBtJcpqhwqKAcv4PCJsaehOFwpxuooyjSoTdO7UxxCOvAm+nDfj
	 GoYugtdxOYXXa++ONB7dz5pzQ36/+cBF5E51GLr1rskfbFUrPMaht1GyEhS3o7N3eczj7I0PUG0qYN
	 Eos+Vwk5qBP6mILc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af6e812d18-e9485;
	Fri, 13 Nov 2026 18:36:04 +0800 (CST)
X-RM-TRANSID: 2ee56af6e812d18-e9485
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af6e812fdf-22a01;
	Fri, 13 Nov 2026 18:36:04 +0800 (CST)
X-RM-TRANSID: 2ee26af6e812fdf-22a01
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	netdev-bot+sinfo@kernel.org,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	jan.kiszka@siemens.com,
	diogo.ivo@siemens.com,
	haokexin@gmail.com,
	horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net 0/4] net: ti: icssg: Fix device_node handling in prueth_probe()
Date: Fri, 13 Nov 2026 18:36:01 +0800
Message-ID: <20261113175000.3150-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261112093706.55e00f17@kernel.org>
References: <20261112093706.55e00f17@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_023625_106122_340100CC 
X-CRM114-Status: GOOD (  10.54  )
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

On Thu, 12 Nov 2026 09:37:06 -0800, Jakub Kicinski wrote:
> If only you read the message the bot sent you would would know that
> you're supposed to add this to the cover letter when respinning.

You are right, my apologies. The bot's message clearly says that if
the series needs another revision, the information should be included
in the commit messages then. Since I was respinning this series
anyway, that was the time to fold it into the cover letter and the
commit messages, instead of replying with links to the v1 threads and
leaving reviewers to chase the information across postings.

Thank you for applying the series, and for the fixups in the applied
commits. The added note "untested fix to unlikely driver error path"
matches reality: the series was not tested on real hardware, and the
affected error paths are only reachable with a malformed device tree.
Thanks also for correcting the Signed-off-by name.

I will include this information in the commit messages directly in
future fix series.

Best regards,
Xiangwu Lai



