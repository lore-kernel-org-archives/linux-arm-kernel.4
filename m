Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60616606A89C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6ynTVQo;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W88VeegF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ER7CQJLmf8a3n65haz0Sx18P2Y6E6cMclcthPxuIRO4=; b=Q6ynTVQou7CtySUHX2vMC+XB32
	cBhB9zo+owmnl6eqJ8OXr35yAHJGYjiJO1kMDA2+FnjGkKrGQho9+7/nCunZSRzs7Hcspe4CHCaJl
	ahpfPAqnRJI028DihLI1QV5yIIMQt8HkrXIDIHgSXksnRqI6SnXjLWkj6NxVBpkcU/P3wyCM9X69+
	jEOKG0d3Mg6fkVGCvUYIlZfYRKJBfw1T9Bu3dRnB78lOlkNtGV2ZxjL40PsVPr2ZwAKdXTEebAvcs
	um2sTmCfv2oLWtFMKKUW4fVOIAFx9C41sym0C9kcKf4Wf0LqZkR4vey1BRt3Beiq/PGLxF/qBqw9F
	/C118xsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB5F-00000007Amc-3d3x;
	Wed, 11 Nov 2026 16:22:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB5D-00000007Am3-3UUA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:22:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5733F1576;
	Wed, 11 Nov 2026 08:21:55 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECC363F632;
	Wed, 11 Nov 2026 08:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794414118; bh=wIEcp4gG3RzK9CK7Bl4yceNnesqt7U9huqJkdKCFszc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W88VeegFHLuNIGCmJW36kYi+ePaj9zkWVn2/RZB+WHKlySxcmt5Bpb03Zk8BymLTO
	 8ccvQwCTbFg/uK2HDV8+qGU1IWmWrs8DEId67UP31hZZxak8AC6Vl+E7Snrq7VJKIC
	 H54c6aGUgnwqcCdGApUoDr3nHLmtaji9gr+bE2GU=
Date: Wed, 11 Nov 2026 16:21:55 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v2 06/23] coresight: trbe: Drop redundant disable from
 enable path
Message-ID: <20261111162155.GE9176@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
 <8136ec16-8132-4212-8ccc-6aff05ab698c@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8136ec16-8132-4212-8ccc-6aff05ab698c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_082159_913729_E5F92693 
X-CRM114-Status: GOOD (  15.26  )
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

On Mon, Nov 09, 2026 at 04:27:31PM +0000, James Clark wrote:
> 
> 
> On 16/10/2026 17:55, Leo Yan wrote:
> > The Arm ARM (ARM DDI 0487 M.c) rule RDJMDD says:
> > 
> >   | When the following conditions apply, the PE might ignore a direct or
> >   | external write to any of certain Trace Buffer Unit registers, other
> >   | than a direct write or external write to TRBLIMITR_EL1 that clears
> >   | the conditions:
> >   | • TRBLIMITR_EL1.E is 1, and either FEAT_TRBE_EXT is not implemented
> >   |   or the Trace Buffer Unit is using Self-hosted mode.
> > 
> 
> Doesn't the rule just say that the buffer must be disabled before doing
> writes to other registers? But the explanation for removing the extra
> disable is that it's already disabled at this point, so nothing changes.
> 
> The commit message would be clearer without this bit IMO. There's no
> architectural requirement to make this change, it's only a software one.

The rule reference was intended to provide context. The main purpose
is to clarify the rule remains satisfied with this patch.

I will refine the commit log to make it clear.

Thanks,
Leo

