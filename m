Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD34606CA7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U0QISoyX;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sMNffbLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A1VaN9f4/cFlIZSIsTrldSLLSX9OOvLT3l5z1334C9w=; b=U0QISoyXHLh/WS
	xBfzGTSI6P9pfSEdDeoySrLBYvmxHeEgOAIcIVPpOkP9jNspvErXMFDrFAoEvOK3RED/n8KYOFBYQ
	XQxn1fGAUNJGhw0EeT9Wvh1UlvXqBRhqn7uHGzCWkcxPWbcfv7vmM3gayLBNoczI5GPksshvq/ybi
	H3IuDsBuY+GceVzcToLexWfvK+7XPquvh75DO65Kkq/HFFenAtaTgNvknz0fXpwnVxX1RANCvroCv
	BCJzFjCA95HcHSFeFRx1YnIMZTdT/bmSzZzQUy+z+Seu+R3TKfWjiktuVyPeJGmxXS2I63RTifPCQ
	ka1w1qKOLORW7Ms9HhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZr-00000009mhb-1TUw;
	Wed, 18 Nov 2026 17:36:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZm-00000009mdS-26CS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:36:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B49E01596;
	Wed, 18 Nov 2026 09:36:02 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F05FA3F632;
	Wed, 18 Nov 2026 09:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023365; bh=BuNOgO1EEXKwVKFzMtnNwyCYEHFBovB7uYbCR1sxkBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sMNffbLRTUKECvI0NN89nalLbpY2RigCDGsY2BjSx6tGS5laI6xUzVZI0IU7lygqH
	 QPRsgFFd5fYy5WW3lKH7gLX7hTLxkXvV2uIqHj7VJ1JX1rfLEIN65wE0/0UxqdU1UN
	 6TXxyqhJQIdbf8OxvE72icOm2jQxMYP+VVpdN1PI=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:35 +0000
Subject: [PATCH v3 06/14] irqchip/gic-v5: Use linear DT and ITT when L2
 covers all IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-host_gicv5_fixes-v3-6-13c1859e8aa3@arm.com>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fuad Tabba <fuad.tabba@linux.dev>, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_093606_592281_550EA86B 
X-CRM114-Status: GOOD (  11.70  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DT and ITT level selector incorrectly chooses a two-level table
when the selected L2 table has exactly enough entries to cover the
full ID space. There are no L1 index bits in this case. ITT allocation
correctly rejects the layout and device registration fails; the DT
path instead allocates an unnecessary one-entry L1 table.

Select a linear DT or ITT when the L2 width equals the ID width.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 88d18822a1ff4..5f9fa80ea6aa6 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -337,7 +337,7 @@ static bool gicv5_its_l2sz_two_level(bool devtab, u32 its_idr1, u8 id_bits, u8 *
 
 	l2_bits = gicv5_its_l2sz_to_l2_bits(l2_sz);
 
-	if (l2_bits > id_bits)
+	if (l2_bits >= id_bits)
 		return false;
 
 	*sz = l2_sz;

-- 
2.34.1


