Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED11606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zcQhbxGC;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gSf8YyXR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4t911jJJvWhrsjDIpyGagM9cDytMeOWYFI8KdrirlU4=; b=zcQhbxGCB0V0SmuEvzdxI+hfAz
	MmfuR3xPnan/5EftM9gVs9byjDvUWjBZZqR6nRQUA5+V04Qqo7EFt/iUt1yCwBbNnsU7qAWEDdrPO
	m/QZTDybTwFpGCeyleuih5qamKrajDxhGe/R95kYnnzQUQLWghky3zOwT8W0gvYXdCf+ivTZaniN0
	5DxXp57lFzZhKKQF2MszrXK0Qs4yFYkPPIOt9A0/MoiXEbiScmO9CDc1jlxm7nMikrpAnMSXx50Kr
	UqErtK9bnLHFkoAbuXYPZYzRgGwX/QM5NVuuLvdfA17/YvlcFlMrridka8wZaFs+JmhDsNt2kBwr0
	FAvzRQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRawL-0000000AyrK-06Bt;
	Thu, 12 Nov 2026 19:58:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRawG-0000000Ayqd-07oq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:58:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B576143D;
	Thu, 12 Nov 2026 11:58:24 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A1693F632;
	Thu, 12 Nov 2026 11:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513507; bh=zTQZ0wPiRPzG5KvnZwBepqQecfUeLrclLLCkbgmimQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSf8YyXRyxaFwVgdpDZwuColKREm5V05Ulxib8DUmO/o1HBzDKhSD8qqkXorYpMtM
	 83Nvy3ozALwBRBpVnHL+bGyhIVTaYEMxDcpt4PcMET7HXb4NWbAbps2AAnK4xSkvxQ
	 idRUfvikMMm++jb5gBZhtIYZEdfHV0Lofau4ftcM=
Date: Thu, 12 Nov 2026 19:58:21 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 22/35] firmware: arm-scmi: Add Telemetry generic
 event support
Message-ID: <avYaXeQqGOLLAxKm@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-23-cristian.marussi@arm.com>
 <20261110143356.0000451a@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110143356.0000451a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_115828_111811_A541C8BE 
X-CRM114-Status: GOOD (  13.07  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 02:33:56PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:12:08 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add support to allow SCMI driver users to subscribe/unsubscribe to specific
> > Telemetry  abstract (non protocol) events.
> 
> Bonus space before abstract.
> 
> > 
> > This enables SCMI drivers to subscribe to available events by registering
> > an eventfd context that the core SCMI stack will use as a signalling
> > mechanisms. Still no real subscribable events introduced at this point.
> 
> Adding a fake event isn't that helpful. Just combine with the next patch.

Ok, it is just that this was supposed to be a generic framework for more
events to come beside the generation counter, so this patch added the
basic common mechanism.

I'm anyway removing this from the live series being unused for now...

Thanks,
Cristian

