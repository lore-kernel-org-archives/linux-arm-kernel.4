Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zgG04p1b;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Wur+ts2i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7MSC8tyJcCP6adu00VgPv2n65XdQvdHW2V0HxWy2VOE=; b=zgG04p1bVFO4h0UmNXOQ7hNyaK
	1wwvQE7cgLpprhi1Z1FKE0yW5h2hgSsinDDiEJQdUgaSlJPLvnFd24LdbIIo+TF2Hw1KKjySkeCm9
	HJccwo8sXZkso6OIu8qa7Snc2m62CdgPyvFsUMDA5dmFUrTLcM56dRMdCtAr4W48/MzpMPT4+jQ7J
	vkvdV7IH0w9jBV/zz8pVq3jPh9eG/UMxoVjZqsgonDoZPYnjgImPLHjCfH0kELDSXy8A7gq3c69gF
	sQCvNnqAaIcjofl8wHPSlKk8gMXqVLAh3U4s1iorNVw4R8isJ6eQ6r1l44OJGEzDD/i3txZvSk+uI
	BmGGOxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvso-00000002MeK-1LAI;
	Mon, 16 Nov 2026 12:32:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsi-00000002Mb3-3vQF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:32:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 585DE1713;
	Mon, 16 Nov 2026 04:32:14 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 797313F632;
	Mon, 16 Nov 2026 04:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794832337; bh=fsRFKdJGXNGJRXLOPXiRq+GCrSCtMtkgn4mHP2tFsoA=;
	h=From:To:Cc:Subject:Date:From;
	b=Wur+ts2iopVUE3OSA4n29TFEhbXooS8LaNgpIre/Mc70GVQjMF34iZTf8xCFVzWp+
	 yZ6n/Nxetq7aXUkGsIWLpRuSu9xf0zcl5Czc9+iNy+DJCXuLVuD31WL+iBTV6X3aHq
	 4+CjaboBygCmj+u+VXT9fofLfCz2tDJKp9yno8Dw=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	philip.radford@arm.com
Subject: [PATCH 0/2] firmware: arm_scmi: fix shared memory and protocol table
Date: Mon, 16 Nov 2026 12:31:51 +0000
Message-Id: <20261116123153.2672631-1-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_043221_028313_073CC964 
X-CRM114-Status: UNSURE (   6.49  )
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

Here is a short seires to address two SCMI bugs reported by Sashiko.

Patch [1/2] slightly alters logic to avoid using an uninitialized
reg_io_width value when selecting shared memory accessors.

Patch [2/2] handles missing SCMI protocol ID tables in registration and
unregistration paths.

Based on V7.4-rc2.

Thank you,
Phil.

Philip Radford (2):
  firmware: arm_scmi: uninitialized reg_io_width in shmem_setup_iomap()
  firmware: arm_scmi: null pointer dereference in
    scmi_protocol_table_register()

 drivers/firmware/arm_scmi/bus.c   | 10 ++++++++--
 drivers/firmware/arm_scmi/shmem.c | 11 +++--------
 2 files changed, 11 insertions(+), 10 deletions(-)

--
2.34.1


