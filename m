Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA887606A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jIcrVIuH;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KNwyI6DU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ld9U2kJWawO8+BzXlSAnk1VRkVDg0Y8wMjAhcptRpHU=; b=jIcrVIuHExJ7Os
	p0tx7P5L/xyW/F2z8z/Z1kAY9CuiRpXRI2g44QCJaP15tKQ2E1EKppxC66Xf1yZ3HJ4lGpnAwxUYT
	+n8xW52jYD7AePOVSqCnnaKUG2w9g5GXdaGBitPyZyULQOhmQJLswOCuwyUPIIVzD+HCER83Oyq7R
	jgGevc+uQVt0Ebx50S7gapob34UfX1ns2EGvs4MAyH1WWLfCSuaDQKL/NGHeVNwIzL0Csk4kVZvBf
	EC1YGJDXJrzxQ782WYxz0dUKX9P7hR861qJCW3vr7PFZNGHkrMynfT3niDIqaxsFEr0StIxhp9ydI
	OEAph+hMidbN4FLRhQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1LY-00000003WZe-2RAJ;
	Mon, 16 Nov 2026 18:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1LR-00000003WVg-2jMb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FA1B1BB2;
	Mon, 16 Nov 2026 10:22:17 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30F7A3F632;
	Mon, 16 Nov 2026 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794853340; bh=V/LDSJSGzghXJO1VTD09y2Y9+Ds1iqTLPb+1X1g1u1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KNwyI6DUSH9ZqFOXOwAHmI+nIZHHCX1CgxRyTP2JJx0z1dsnojgvsRLT49GQK8DWV
	 kYbOY/lT+HBDF4odlR1FGfphz1tyJEUOtieP9711eySdkTW4f6bcW7/dXAQ0NfK46K
	 I0oCl4+oGhd5OszpFlMuFERpdDjgj1/VoEFdIWO0=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 16 Nov 2026 18:21:29 +0000
Subject: [PATCH 2/8] device property: Add software-node IRQ affinity masks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-acpi_arm_pmu_registration_hmp-v1-2-0371d4eca626@arm.com>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
In-Reply-To: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, Will Deacon <will@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hanjun Guo <guohanjun@huawei.com>, Jeremy Linton <jeremy.linton@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Al Grant <al.grant@arm.com>, 
 "Johnny.Fan" <johnny.fan@cixtech.com>, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794853327; l=5316;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=V/LDSJSGzghXJO1VTD09y2Y9+Ds1iqTLPb+1X1g1u1Q=;
 b=egNZpetXUSVXrmJCpvph6uk84Dan/On7mY86Wz9Uw1MSm0IsNoesTEy5sLwbcD4SmxD77fSwI
 0Pfu4aEgwy9Bpvnzk879/chQp9fdx4UWd3Uvw9/MWRvRiSFXzpnmSDE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102221_785478_68E5311C 
X-CRM114-Status: GOOD (  16.15  )
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

Devices created from firmware tables may need CPU affinity information
without a corresponding firmware node. Allow software nodes to supply
this information through the common firmware node IRQ affinity API.

Add software_node_add_irq_affinity() to copy a CPU mask for an IRQ index,
and implement the software node irq_get_affinity callback. Keep each mask
until the node is released and reject replacement so borrowed masks remain
valid for the node's lifetime.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/base/swnode.c    | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/property.h |  4 ++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index cf495e67f0763ad83a849474152e71d0640c76dd..64d5e12e4871771c20a64162260d92d3e24b4191 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/container_of.h>
+#include <linux/cpumask.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -21,6 +22,7 @@
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
+#include <linux/xarray.h>
 
 #include "base.h"
 
@@ -31,6 +33,7 @@ struct swnode {
 	int id;
 	/* Device the managed node's lifetime is tied to. */
 	struct device *owner;
+	struct xarray irq_affinity;
 
 	/* hierarchy */
 	struct ida child_ids;
@@ -756,6 +759,13 @@ static int software_node_add_links(struct fwnode_handle *fwnode)
 	return 0;
 }
 
+static const struct cpumask *
+software_node_irq_get_affinity(const struct fwnode_handle *fwnode,
+			       unsigned int index)
+{
+	return xa_load(&to_swnode(fwnode)->irq_affinity, index);
+}
+
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
@@ -774,6 +784,7 @@ static const struct fwnode_operations software_node_ops = {
 	.graph_get_port_parent = software_node_graph_get_port_parent,
 	.graph_parse_endpoint = software_node_graph_parse_endpoint,
 	.add_links = software_node_add_links,
+	.irq_get_affinity = software_node_irq_get_affinity,
 };
 
 /* -------------------------------------------------------------------------- */
@@ -844,6 +855,8 @@ static void software_node_free(const struct software_node *node)
 static void software_node_release(struct kobject *kobj)
 {
 	struct swnode *swnode = kobj_to_swnode(kobj);
+	struct cpumask *affinity;
+	unsigned long index;
 
 	fwnode_links_purge(&swnode->fwnode);
 
@@ -857,6 +870,9 @@ static void software_node_release(struct kobject *kobj)
 	if (swnode->allocated)
 		software_node_free(swnode->node);
 
+	xa_for_each(&swnode->irq_affinity, index, affinity)
+		kfree(affinity);
+	xa_destroy(&swnode->irq_affinity);
 	ida_destroy(&swnode->child_ids);
 	kfree(swnode);
 }
@@ -891,6 +907,7 @@ swnode_register(const struct software_node *node, struct swnode *parent,
 	fwnode_init(&swnode->fwnode, &software_node_ops);
 
 	ida_init(&swnode->child_ids);
+	xa_init(&swnode->irq_affinity);
 	INIT_LIST_HEAD(&swnode->entry);
 	INIT_LIST_HEAD(&swnode->children);
 
@@ -1050,6 +1067,42 @@ void fwnode_remove_software_node(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(fwnode_remove_software_node);
 
+/**
+ * software_node_add_irq_affinity - Add an IRQ affinity mask to a software node
+ * @fwnode: Software node to associate with the mask
+ * @index: Zero-based IRQ index
+ * @affinity: CPU affinity mask to copy
+ *
+ * The copy remains valid until the software node is released. Call this before
+ * publishing the node to interrupt consumers. An existing mask cannot be
+ * replaced, so masks returned by fwnode_irq_get_affinity() remain valid.
+ *
+ * Return: 0 on success, -EINVAL for an invalid node or mask, -EBUSY if the index
+ * already has a mask, or -ENOMEM if allocation fails.
+ */
+int software_node_add_irq_affinity(struct fwnode_handle *fwnode,
+				   unsigned int index,
+				   const struct cpumask *affinity)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	struct cpumask *mask;
+	int ret;
+
+	if (!swnode || !affinity)
+		return -EINVAL;
+
+	mask = kmemdup(affinity, cpumask_size(), GFP_KERNEL);
+	if (!mask)
+		return -ENOMEM;
+
+	ret = xa_insert(&swnode->irq_affinity, index, mask, GFP_KERNEL);
+	if (ret)
+		kfree(mask);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(software_node_add_irq_affinity);
+
 /**
  * device_add_software_node - Assign software node to a device
  * @dev: The device the software node is meant for.
diff --git a/include/linux/property.h b/include/linux/property.h
index 08c901015a9ea4b9223a29d07749f88a5d672ea7..186a77d1468505a10960efe6cdf7d53750acbf95 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -618,6 +618,10 @@ fwnode_create_software_node(const struct property_entry *properties,
 			    const struct fwnode_handle *parent);
 void fwnode_remove_software_node(struct fwnode_handle *fwnode);
 
+int software_node_add_irq_affinity(struct fwnode_handle *fwnode,
+				   unsigned int index,
+				   const struct cpumask *affinity);
+
 int device_add_software_node(struct device *dev, const struct software_node *node);
 void device_remove_software_node(struct device *dev);
 

-- 
2.34.1


