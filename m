Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C355D606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m+lOAeEG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uVG91/NU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pprxhn7SNkfKNPiAEW5wNbJlXAXRZEVWDfUn3Qm3Prk=; b=m+lOAeEGFRu31Q
	1FTplTxteL5210r2uH1sqzikOG8ifwiAp/GEp47I2KCNctF1bZ/WqL117SDFxyioxlvCUKE7qtT+h
	CTahXwTuy5eHBHee5moZF4Ut+eUGgIvuH9jlQLCxs2zmk2/iEt00BT40x0czpYCDdopv8rDlj2zLg
	lkaoSjitYqUholDwnYDAlzOQYpn7EMKXz85C1DX0NkiVakBNzVCyHa46qmipaRymLy3U4vVFk0viy
	muxKyxMhIddCmfaa2T9m2XEsoI7tfsbwZkmzOTNC+eXxMKRvybSVRh9uiAn5VNOgLRwGH1XvDvO4Y
	x7qp9ge+KMSA1SV4g59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRA3J-0000000740Y-16cV;
	Wed, 11 Nov 2026 15:15:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRA3G-000000073zz-0JwE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 15:15:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418731576;
	Wed, 11 Nov 2026 07:15:50 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D813FA7A;
	Wed, 11 Nov 2026 07:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794410153; bh=d19WkltXV0i6LVlVs/qFDgMqx7ypd2YCR4Ad5YUEAxc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=uVG91/NU0Kjn7NcqJHLIcabrXwl3/B3yxmrjWkpLbk2jOoIYiDlCae3MZS4r54V3d
	 MC0ZYbCrNLdiuxN1qJyddD7Zkmy0KRAUcQTckpsijCgnkmn3LOpjYW3bhcUFtx5fyM
	 i2kWXF/gyrCUAF4NhYpSlNmyDEnAYohb/ly0EaR8=
Message-ID: <aa7fc5d7-de81-4e40-9b2e-5253f0c7bb02@arm.com>
Date: Wed, 11 Nov 2026 15:15:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Account for a MBWU overflow before reading the
 counter value
From: Ben Horgan <ben.horgan@arm.com>
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
 <20261111125601.4120592-1-leeonion.muyu@gmail.com>
 <a97b8d1c-7fe6-40c4-a145-82f63bd0f6e5@arm.com>
Content-Language: en-US
In-Reply-To: <a97b8d1c-7fe6-40c4-a145-82f63bd0f6e5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_071554_204853_A6F28C14 
X-CRM114-Status: GOOD (  31.32  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ping,

On 11/11/2026 15:00, Ben Horgan wrote:
> Hi Ping,
> 
> On 11/11/2026 12:56, Ping Li wrote:
>> From: leeonion.muyu@gmail.com
>>
>> Hi Ben,
>>
>> Thanks for taking a look.
>>
>>> Is the a theoretical fix or has this been observed in practice?
>>
>> Not observed in practice. My hardware team was reviewing the software
>> overflow and NRDY checking logic with me, and we found this while
>> walking through the code together.
>>
>>> Based on this, for MBWU you should only see NRDY set in the
>>> MAX_NRDY_USEC after a change of monitor settings. At such a reset
>>> the VALUE is reset to 0. Are you seeing or potentially seeing an
>>> overflow in this window of time?
>>
>> I agree. Our starting assumption was IHI0099B.d 6.2.1 RGKWNB - that on
>> a settings update the monitor VALUE field keeps counting using the new
>> criteria without automatically resetting to 0. But as you point out,
>> looking at the reconfiguration path in write_msmon_ctl_flt_vals(),
>> the driver deliberately writes VALUE to 0 as part of the IDGYLF
>> sequence, so the accumulated count is discarded there and even a
>> 31-bit monitor cannot overflow within the NRDY window after a
>> reconfiguration. The overflow and NRDY cannot collide.
>>
>> My apologies - there was a second trigger in my original analysis
>> that the commit message failed to mention: any error reading the
>> counter value after the status bit has been cleared loses the
>> accounting the same way, and mpam_msmon_read() does not retry
>> non-EBUSY errors. For a MPAM_F capable MSC, mpam_msc_read_mbwu_l()
>> and mpam_read_monsel_reg() go through the PCC mailbox and can return
>> -ETIMEDOUT or -EIO on transport errors. So I believe the patch still
>> provides protection against this failure path - it moves the
>> accounting to the point where the status bit has been read but not
>> yet cleared, and it is a no-op in the normal path.
> 
> I see. This is a side effect of the recent addition of support for MPAM-Fb (which uses  the PCC
> mailbox). Any error relating to MPAM-Fb is considered as an indication of MPAM being broken and mpam
> is disabled using mpam_fb_disable_mpam(). After this point normal driver behaviour cannot be
> expected. So, if we do hit one of the MPAM-Fb failures then we've already triggered a tear down of
> the driver. Hence, your patch isn't fixing anything that effects the normal operation of the driver.
> 
> Having said that, it is not pretty to rely on the MPAM-Fb failures being catastrophic and makes the
> driver more fragile and difficult to reason about. Jin Jie has a patch [1] which addresses a problem
> related to when control configuration fails due to an MPAM-Fb error. I don't currently intend to
> merge either of these patches as I still think there is likely to be more of the same lurking in the
> driver and I don't want to do this piecemeal. I may take them later though, after I've audited for
> any similar problems; a couple of small changes are worth it for making the driver easier to reason
> about.

Just to clarify, it is still necessary that on any MPAM-Fb failure the error is passed up to resctrl
and then the user when they triggered the request. I will shortly post a small series that fixes
some problems in that area.

Thanks,

Ben

> 
> [1] https://lore.kernel.org/linux-arm-kernel/20261104101541.563113-1-ruanjinjie@huawei.com/
> 
> Thanks,
> 
> Ben
> 
> 
>>
>> Thanks,
>> Ping
> 


