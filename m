Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0EA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DD/UnkTx;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=co5amkzN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eVM5XFxpTekZI/TznZd5JXWHYNNpDG15hrmiBUopk64=; b=DD/UnkTxbz9Q5A
	+10cgM4IqubRdiytOyLPeqR8RLRpW46CH7HnNJVDQHNB5tieLL5vCFKCZDyvdZEHUZBzEJiN+iATS
	WNFE/C80aOuIxZQastNImo3YLgVq8fvNNpPW7cLRJmRdeFKXxIYiPsd+qErPvgtwq5SBC2IQ35fAX
	ZIn3/6W/glgOzI4+VZhFV9KW05sFOnyc9zY0x7fZqcSG0Nbg1ZFvlfHI7NnoR7EImg6mso92z3Pdm
	1FnKqWo1/j5HazUzs26NVEXlnysMOBWM0FirH4gxvcCsb9wg5TD+7Jxl6m24YqegU46qsv1CpMrYD
	IwDixX/z1UU1vpnsz9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbl2-00000002BXj-1BZW;
	Tue, 10 Nov 2026 02:38:48 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbky-00000002BWQ-2kxp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 02:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=co5amkzNgSM4eSt5maBYOipTvdJoD6KKIekUMjO8V3MWhhzeyX9HKO0FPrl7hK+x6rW87jGNkhQv1
	 g2Mj+zIRy1+f7dzbSNu8JqA0UpxsDc5rFRGiPSTc19Onygrz2M6IEz9LAxzagDCIwyHqQD0+7K6Miq
	 1EQC0kK4WHuGSd9o=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af283aa5da-9616b;
	Tue, 10 Nov 2026 10:38:34 +0800 (CST)
X-RM-TRANSID: 2ee66af283aa5da-9616b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af283a8745-a37b7;
	Tue, 10 Nov 2026 10:38:34 +0800 (CST)
X-RM-TRANSID: 2ee56af283a8745-a37b7
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
Subject: Re: [PATCH] net: ti: icssg-prueth: Fix device_node refcount leak in prueth_probe()
Date: Tue, 10 Nov 2026 10:38:30 +0800
Message-ID: <20261110103000.3141-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261109165902.GS18859@horms.kernel.org>
References: <20261109165902.GS18859@horms.kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_183845_264361_AD46F3FA 
X-CRM114-Status: GOOD (  20.39  )
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

Thanks for the review, and for looking into the neighbouring error
paths.

On Mon, Nov 09, 2026 at 04:52:35PM +0000, Simon Horman wrote:
> But I wonder if this nearby check also leaks a reference,
> because while it drops one, wouldn't there be two if the
> condition is met?

I don't think that branch can be entered at all, so it does not
leak in practice. eth0_node and eth1_node are both initialised to
NULL, and each iteration of the port scan loop assigns at most one
of them (the reg == 0 and reg == 1 cases are mutually exclusive),
while for_each_child_of_node() visits each child exactly once. So
the same node can never end up stored in both slots, and the
both-NULL case is already handled by the preceding "neither port0
nor port1 node available" check. As far as I can tell, the equality
comparison is dead code.

The DT error the check describes, two port nodes carrying the same
reg value, does leak a reference though, just not through that
branch: if both ports have reg = <0>, the second assignment simply
overwrites eth0_node, the reference taken on the first node is
lost, and eth1_node stays NULL, so the equality check never fires.

On Mon, Nov 09, 2026 at 04:59:02PM +0000, Simon Horman wrote:
> Sorry, one more thing. Which is not strictly related. But as we're on the
> topic of error paths in this function, I am not convinced of the validity
> of the value of reg being used even when the call to of_property_read_u32
> fails in this loop:

You are right, the error is only logged and the uninitialised value
of reg is then used to select eth0_node or eth1_node. Depending on
the garbage, the node is routed into one of the slots (including
the overwrite case above) or, when the value is neither 0 nor 1,
the reference taken by the of_node_get() right before is leaked, as
the node is not stored anywhere. This is the pre-existing loop
issue I mentioned in my reply to the bots: the "port reg should be
0 or 1" branch leaks the reference even for a valid out-of-range
reg value.

Understood on the patch-set, and thanks for the hint. I will send a
v2 that combines the fixes for the two drivers, keeping them
unchanged and adding a per-driver patch for the port scan loop that
skips a port when reading its reg property fails, only takes a
reference for reg values 0 and 1, and rejects duplicate reg values,
which is what the existing check seems to intend but never actually
catches. Happy to adjust the split if you would prefer the loop
changes as a separate series.

Best regards,
Xiangwu Lai



