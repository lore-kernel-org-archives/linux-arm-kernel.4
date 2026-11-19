Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B769606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Jyx4tXE;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UdcRID8K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FpRAw10TJh8yb7R34VwZYYTrEJ2MgNuHTOaOU0kAmbg=; b=1Jyx4tXEU0zPe2I6Sre9i0s+5S
	pNuybsDUN6Sxrp1FFtCUJH/oyXvdi4bUT2pAvuf0iQbEpSIGUO6haepBlVUGob7yZpd5qMVJlYJ+L
	MFaK1d224QlPR9YYoDaPcKOwdrV2NgeB7BNrpAL9anrpg8iMnHzRo1t7ww3OeA5mnCvZBsPYwLQIp
	bklFXzLLwUUQvA0pXlJfZo0mB69t2ZTW6tkPmCMPPCPjjgM4YaUeCPPP6oepcy015alSKOZ9pNsQ8
	2Y3bafDAikmSEhfsWFb5uA+rVsVvf919nbVM411mPb7oqc2+o7fMWKM9AFhGNXncgqcUbatHALsrf
	ssxNVzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Ol-0000000Cjpm-08JD;
	Thu, 19 Nov 2026 16:54:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Oi-0000000CjpI-0mtu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:54:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8A901575;
	Thu, 19 Nov 2026 08:54:03 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 360A43F673;
	Thu, 19 Nov 2026 08:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795107246; bh=UH4KDSFam0LfRKFnI3gJVWSsyCyljyOGfCQ7wrragEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdcRID8Kz4lZK/h1ThJUkIPZuCu8llRVTIWUol7CEgsEAJDWIJ0dMrQdRTWZMoOz2
	 XP992aMvTFRo5UvN7IMTff5COtXdHBV8kWVELcF8QaQZkmk72M2pRJtv6Ua4OgHRjd
	 /qd3KyGzwJg18bFRXM4FHYSooM96/pJ6aeSI40CE=
Date: Thu, 19 Nov 2026 16:54:04 +0000
From: Leo Yan <leo.yan@arm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Al Grant <al.grant@arm.com>, "Johnny.Fan" <johnny.fan@cixtech.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 2/8] device property: Add software-node IRQ affinity masks
Message-ID: <20261119165404.GA9176@e132581.arm.com>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
 <20261116-acpi_arm_pmu_registration_hmp-v1-2-0371d4eca626@arm.com>
 <avwHQXJxOir8XXxX@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avwHQXJxOir8XXxX@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_085408_320904_B8CFCC0A 
X-CRM114-Status: GOOD (  21.37  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 09:50:25AM +0200, Andy Shevchenko wrote:
> On Mon, Nov 16, 2026 at 06:21:29PM +0000, Leo Yan wrote:
> > Devices created from firmware tables may need CPU affinity information
> > without a corresponding firmware node. Allow software nodes to supply
> > this information through the common firmware node IRQ affinity API.
> > 
> > Add software_node_add_irq_affinity() to copy a CPU mask for an IRQ index,
> > and implement the software node irq_get_affinity callback. Keep each mask
> > until the node is released and reject replacement so borrowed masks remain
> > valid for the node's lifetime.
> 
> 
> This is definitely not a place where to put that. Are you stating that any
> software node might find the IRQ affinity information useful? I don't think
> so. With that in mind this approach looks like a layering violation.

My intent is to expose optional affinity information through the
common platform_get_irq_affinity() interface.

As an alternative, could we represent the masks in an "irq-affinity"
property, with one CPU mask per IRQ index? The swnode .irq_get_affinity
callback would read it, using the existing property storage.

Would interpreting this property in swnode still be a layering
violation? See the sample code below.

---8<---

+static const struct cpumask *
+software_node_irq_get_affinity(const struct fwnode_handle *fwnode,
+			       unsigned int index)
+{
+	const struct property_entry *prop;
+	const void *masks;
+	size_t size = cpumask_size();
+
+	prop = property_entry_get(to_swnode(fwnode)->node->properties, "irq-affinity");
+	if (!prop || index >= prop->length / size)
+		return NULL;
+
+	masks = property_get_pointer(prop);
+	return masks ? masks + index * size : NULL;
+}
+
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
@@ -774,6 +796,7 @@ static const struct fwnode_operations software_node_ops = {
 	.graph_get_port_parent = software_node_graph_get_port_parent,
 	.graph_parse_endpoint = software_node_graph_parse_endpoint,
 	.add_links = software_node_add_links,
+	.irq_get_affinity = software_node_irq_get_affinity,
 };

> ...
> 
> And overall, the domain specific (IRQ, DMA, et cetera) topics feels a bit
> misplaced when one can find that in the generic properties. We also have
> that PHY thingy, which is complete alien to word 'generic'.

Since software nodes have no standard property specification of their
own, would this be an appropriate way to define "irq-affinity" as a
generic swnode property?

Thanks for the review!

Leo

