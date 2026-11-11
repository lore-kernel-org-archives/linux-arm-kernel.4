Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783FB606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=InWB0LAk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VfZrepJ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IVSW7dlEtBAkMcVOOPixBHDjudsel8asjWSLmfExFeY=; b=InWB0LAkr++Bm4fc/M2T+8ZIFr
	g2w0q2TsC9mvGc7TVRZuQDge9GpzkuI1uX1kszteexm1CPEvjfqapm8RUGxtesH4GupjRu6z8ROTW
	M2lwqOkGmhNXnngt9mF/pTWcRqyYJFOdglwGnG/vYfCgXKGkjsdh0nd8OiUpIpJ0IxWtfXZf9Hanj
	Fyf52MJeaoqwn3WTdbsEOnR92iuAMeS81m37jGs9hdT3Yift9Prch3di2BGu6wqhZgn23QY9WB+WR
	demsFQQ+KQHLuQ7pxlNXrP5Qu/pj++j35RhNoZCZ0V3vI0od6LRkQzSOPkPhM49UuO1/KbKgV4hBC
	YjuXA59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9vV-000000073IM-2Fhl;
	Wed, 11 Nov 2026 15:07:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9vS-000000073Hn-1640
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 15:07:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D8491576;
	Wed, 11 Nov 2026 07:07:44 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2F9F3F632;
	Wed, 11 Nov 2026 07:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794409667; bh=62Mu4OB+5wrqIV2cz1Z1/DAKB6v44So/0ueSDYAy0eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfZrepJ0INs9KzNnKkWmxJLRps9nRBYmn6mnATtZK6oQjjzaP2Cyyx2TN1dldFmns
	 KnTJe8UyD60giCl785gSW8Jmg3o+OmikZi0qe5odXs+y92IHy7hf9N4u3BnGiR7mLQ
	 cTG6viDoj2FMuBt2iHZiJm0wx8HO+9LXwSRHRZbg=
Date: Wed, 11 Nov 2026 15:07:44 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Rob Herring <robh@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
Message-ID: <20261111150744.GC9176@e132581.arm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
 <14c0956c-904e-4a6a-98a0-882514d77b08@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14c0956c-904e-4a6a-98a0-882514d77b08@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_070750_344843_4054082C 
X-CRM114-Status: GOOD (  17.05  )
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

On Wed, Nov 11, 2026 at 12:58:59PM +0000, Suzuki K Poulose wrote:
> On 10/11/2026 15:46, Rob Herring wrote:
> > On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
> > > The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> > > two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> > > forces the device onto the AMBA bus, where the driver must read the
> > > peripheral ID from the device registers during probe. On several QCOM
> > > platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> > > never probes and its trace path is unavailable.
> > 
> > But it works fine on some platforms? We have a property to override the
> > peripheral-ID which would solve your issue. That would be much simpler
> > and avoid the ABI break on any of the working platforms.

This series preserves support AMBA driver probe, "arm,primecell" would
continue to work.

> That is true ! Sorry, I didn't think of the quirk.

If adding "arm,primecell-periphid" property resolves the issue, I agree
that updating the DTS nodes would be better way to resolve issue (for
this case, anyway it requires to update DT blobs on broken platforms).

Thanks,
Leo

