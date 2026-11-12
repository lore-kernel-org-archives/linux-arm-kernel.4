Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A37C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y4Ve58Mz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jq7zX7UP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vlZqzvtO/HmxUCVMk4ClrKPfCBbBD3nwIw0Aqx6q7s8=; b=Y4Ve58MzuUGLyev7N7Wh7Ss4rD
	pypNJisQSenZ0kPyFlEWjT9hdxCH+qjKaszFdcNQ4SscRndL7JuoWnoAm5QxTw1H7QLcBxDxud6FC
	bEi2056RVWTvgP6Rf0H1oOL+LK2yL3F2OpN5u6F35HETlwASBwmLNb8657IPajpBHljFWJ8YD7TRz
	3WuHJ1XFCRUzLIjNcTW/hPkA3P59wpqHBd0QTtFrR3bslpfjQfF+zgpQCRGcFpN03+FUdYFUwl3xA
	yx/rbQoRBs0nZQLOyHbwHr75rG/nU9hUenSSXyEqh7bYt0aUKOOEX+e+qMPaw8ZwIAfjPCKlP+gwm
	5vmh5Gcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbEy-0000000B0Mh-09MQ;
	Thu, 12 Nov 2026 20:17:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbEw-0000000B0MC-1qqW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 20:17:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 999E91476;
	Thu, 12 Nov 2026 12:17:41 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C24143F85F;
	Thu, 12 Nov 2026 12:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794514664; bh=DnwmvWTMD0sYcZHcAwFeqJGrssc3hWAPd1jsUWH9nHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jq7zX7UPusnlrQDCRHmcPNVl/vzqAPi+FegZnwm3Pt1YkHaYivIZr71Q5Drr84h3q
	 jz0ToTS4kG49dKWJZ/N5/ZJWJSNWuMDd578NPEuGqhVAmmghvcy+m/z7Wlgc9nlwG8
	 aMukWx6kAdWikQyxq87aS9kWk0f0h7pze288UyMw=
Date: Thu, 12 Nov 2026 20:17:35 +0000
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
Subject: Re: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation
 counter event
Message-ID: <avYe37QP4Upvp51c@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-24-cristian.marussi@arm.com>
 <20261110144635.00005964@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110144635.00005964@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_121746_527413_1689C3E8 
X-CRM114-Status: GOOD (  12.04  )
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

On Tue, Nov 10, 2026 at 02:46:35PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:12:09 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a per-instance generation counter to track configuration changes which
> > uses the common telemetry events framework.
> Why?  What's the usecase for this?
> Needs some more information or I'd leave it for now.
> 

SCMI Telemetry is specified and designed FW/Kernel side to allow for
multiple readers and multiple writers issuing configuration changes:
give that there is NO HW/FW/SPEC limitation in allowing such concurrency
(unlike e.g. for a serial or an RTC) the telemetry driver does NOT
enfroce any kind of exclusive access...last one wins when multiple
acctors tries to configure overlapping stuff...none of kernel problem
userspace should co-ordinate...and I suspect most of the time having
multiple apps trying to concurrently issue conflicting Telemetry request
would be a matter of wrong platform configuration/setup (similarly to
what would happen by running together all the lovely varied network
configiratio solution on a Linux box...)

As said the Kernel SHOULD NOT care, going back to the networking example
Kernel indeed does NOT active policy netlink access..you are free to shot
into your foot...

Anyway, co-ordinating access to the Telemetry resources in userspace can
be a pain, so the the generation counter is an optional mechanism to be
alerted when some of the Telemetry has been changed, so that userspace
can spot that something odd is happening (if it was unexpected) and
avoid to sample and analyze bogus data...

The generic event support upon which this is based, it is meant to
support future events like relaying notifications to userspace...but
given that notifs were NOT implemented for real, it is not present (NOR
the related ABI...)

Thanks,
Cristian

