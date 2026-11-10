Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1408C606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kKCYhYK8;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lSWsvL34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4CxrLZlhsnLdjHdcH6odGSKbaksvNehmIBPyUx6+8A8=; b=kKCYhYK8klmD9TH+ebEkCzba8c
	LGNachZliPCpCwAHr52D4stcrqoimPg66JMJGbQXFJvza4Y/vAagmhYTfMO9KySigUZSIashhL1+x
	x+bjcDY5hBmxGx4zaQ/cjPeCQmWjL1vJindC4VTWpn9Nsu373GFMY4sdcDGVwuD8WhgaytsdlIMvx
	psJXGuWCyjP6RsrJLSIWmPv5To+nc+jlJzZnnUxliG1X+kW8w4blPlZGd4PDJrLVvgiux8cxtk3og
	j3LquF7oNTOsagbXjohHJ890DGaUwys701913flds5n1JG4VKKbitqsoZecyV4Lz98Hol3hwlGZrn
	u6o2nssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh8c-000000036aD-0RiJ;
	Tue, 10 Nov 2026 08:23:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh8Z-000000036ZO-2XSU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:23:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BD4F1516;
	Tue, 10 Nov 2026 00:23:23 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B9863F85F;
	Tue, 10 Nov 2026 00:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794299006; bh=Fl19Ryaf0hHQ4aMbgjvRFTo4nuE32BVuV0ZlxaZOhio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSWsvL34M78tV3BIMDLbw/jmNXTj+YeoDW2V2Ihv1AgrovPFzPDVM1wdRqM/mh92x
	 AfsnD3BwMbT7jxmBEfpYCeiHcxa1DpCoh2FgBk/pU8N+Hhyuab5ONtzv0s3YtXESzT
	 C289T8bTqip/4SqJVn3ZaHVbG9bupQiiMPFRIXZU=
Date: Tue, 10 Nov 2026 08:23:20 +0000
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
Subject: Re: [PATCH v15 03/35] firmware: arm_scmi: Introduce a dedicated SCMI
 Errors header
Message-ID: <avLUeIlY89i5Mahs@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-4-cristian.marussi@arm.com>
 <20261109140129.00004b4f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109140129.00004b4f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_002327_685040_025635A5 
X-CRM114-Status: GOOD (  11.91  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 02:01:29PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:49 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a new dedicated header and move all of the errors definitions and
> > mapping helpers into it and out of common.h so that SCMI errors definitions
> > alone can be easily included in protocol files without all of the unrelated
> > additional stuff contained in common.h
> 
> In ideal world I'd move first and add the new codes later.
> (so swap this and previous patch).
> 

Ok but logically the new separated header is needed by the fact that the
new added error codes has to be checked in-protocol and including
common.h in protocol unit bring in a lot of unneeded stuff.

> Trivial thing but reduce the patch size a tiny bit!
> 
> Other than that, seems like there are enough of these
> for a separate header to perhaps make sense.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Thanks,
Cristian

