Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB27606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sN5aMTFa;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FXFV5cLl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MIi4Hjgf0ad8LYLMaOyFuMEZmfNfqGqK7YiBKEuihGs=; b=sN5aMTFaJa3ZdOwlvo+AAde7s7
	KaaaaosmM8YfuPrJs8VdcjDdJACOZRIaf7fwFFJoFEF71XgJCig064XOkJw73hwiYJF/i3CbbTm3T
	DnDERwlA29F+uoS/N4Z73F6Pq9APBoeMsrDS64wlDgQakH3yO243QUzA4o0bMlPrQSvIgaDE5tUux
	8YxXSDluwOl4tAjCMwioz4ca89LRBrl5Vq3iYdUaEgDmrpm8419JR6snsdS2v+pXYSeyRbJSGdAMg
	5KBBP3FHM0fndd9Y20Yo2s3yXLI4yh99A5sN0oLRNkR5GO8Qo2VK1i9hbPkj/0dbpxqPDBK16uKO8
	C++I6W7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvcA-00000007Xp9-3oLZ;
	Tue, 24 Nov 2026 18:51:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvc7-00000007XnP-2ifs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 18:51:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14F33497;
	Tue, 24 Nov 2026 10:51:30 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F5213F86C;
	Tue, 24 Nov 2026 10:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795546292; bh=bw0eKGi+nO4EfAJOpprYf++ygxFHMmD6pckeKCqtn0c=;
	h=From:To:Cc:Subject:Date:From;
	b=FXFV5cLlihW+cnr1GL//DoAx8sQikOfDN5lxwMP97KskoFW7tef36kUJkLQM0ShIi
	 C1v1Kjy5wh1XVLa0AMoN26l05vRuETzO9F8mi7ZdOL1yGoFtTwkI4jEg884UpmGzkm
	 TWv7ld2zWZbNKpR0kaLhT9WTS8DSOHhX7ngRggWc=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/2] SCMI protocols fixes and refactor
Date: Tue, 24 Nov 2026 18:51:09 +0000
Message-ID: <20261124185111.1022322-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_105135_728475_537E2BF6 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

A tiny series addressing a minor protocol initialization issue reported by
Sashiko (patch 1/2) and a general tiny following refactor around that same
protocol initialization/fnalization code.

Note that the refactoring moves around the scmi_protocol_put() calls on the
failure path of initialization AND on the protocol release code flow: this
basicall causes the module_put() where needed to be called after the
protocol devres group release, which is how it should have happened really
all the time to avoid races at unload time. IOW the logic is a bit changed
BUT there should NOT be any functional change...at least intended :P

Moreover this standalone tiny series will be also reposted within the
larger Telemetry series to avoid conflicts and ease merging.

Thanks,
Cristian

Cristian Marussi (2):
  firmware: arm_scmi: Invoke proper protocol cleanup on failure
  firmware: arm_scmi: Refactor protocol allocation

 drivers/firmware/arm_scmi/driver.c | 58 ++++++++++++++----------------
 1 file changed, 26 insertions(+), 32 deletions(-)

-- 
2.54.0


