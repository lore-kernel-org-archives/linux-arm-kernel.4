Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mf6w0b51;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=IBNWCKWb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AsVO6L0VXItBXY4OufcgsE+LrhkDwwft4iRAk/G8ycA=; b=mf6w0b51CnbNFHaoDY8X7D+8XN
	3qwnCBSwBZP3Wpyme+KT62fUQJFjK1KeSTC80FzjE87a7nLPSs7QC7rgLW0igKk/vd93gpRCrj1P7
	Eo2AR5JmOOVF+AC0F4iS0Xqp+4t57dkepVwlcVYSG9Z5hTfNgTQZqrWldLvn6JDlW+So9q/4J1yZa
	2/LFYzvHOTPOj9UNvzVDLg53JzMXkPr2KLmGX8++2JEM+hpvXq6uCzaSSSLY7pRuwkSWRcvO/AAjy
	1Dp6WnRhMbX4qSJiJ0/Ipj/pwxcJYj5q6IoTB6tudnU8TaUmRU6KAQfoojn1/tgzvgZse4kyv37Rd
	4wgwc1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNjQ-0000000Bi5H-30G0;
	Thu, 26 Nov 2026 00:53:00 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNjM-0000000Bi4r-3Pko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795654374; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=AsVO6L0VXItBXY4OufcgsE+LrhkDwwft4iRAk/G8ycA=;
	b=IBNWCKWbk78186Aa4mTOoE0y9lKuauJtMgwpWplBaQbx5ATHP6uf2B6QLuSgre0pvhe8o8gVE6K6ZENp8kycd82VXyK+VfC5d3mDQ8NBSUCQDxmSwZH7a073BMFGt5hVr77pcLU8QuzLtyK5ArJrvPZAodoq4XK8+qrZUiMqcXU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fengwei_yin@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XFSm-aX_1795654371;
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0XFSm-aX_1795654371 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 08:52:53 +0800
Date: Thu, 26 Nov 2026 08:52:51 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH 1/2] firmware: arm_sdei: Do not signal event 0 to a
 masked PE
Message-ID: <aweC4_pzRjo9V0zz@U-V2QX163P-2032.local>
References: <20261124194707.1030653-1-kas@kernel.org>
 <20261124194707.1030653-2-kas@kernel.org>
 <awavUsKX4XLRMbUq@U-V2QX163P-2032.local>
 <awblcOnI8JVhpmPK@shutemov.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awblcOnI8JVhpmPK@shutemov.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_165257_522150_1A1F230A 
X-CRM114-Status: GOOD (  19.79  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, kernel-team@meta.com, Vladimir Murzin <vladimir.murzin@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Cong Wang <cwang@multikernel.io>, Liao Chang <liaochang1@huawei.com>, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Ashok Raj <ashok.raj@oss.qualcomm.com>, James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Pengjie Zhang <zhangpengjie2@huawei.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 02:00:40PM +0000, Kiryl Shutsemau (Meta) wrote:
> On Wed, Nov 25, 2026 at 05:50:10PM +0800, YinFengwei wrote:
> > Hi Kirill,
> > 
> > On Tue, Nov 24, 2026 at 07:47:04PM +0000, Kiryl Shutsemau (Meta) wrote:
> > > The SDEI NMI backtrace signals event 0 to every other CPU, idle ones
> > <snip>
> > > +static void sdei_block_signal(void)
> > > +{
> > > +	struct sdei_pe *pe = this_cpu_ptr(&sdei_pe);
> > > +	unsigned long flags;
> > > +
> > > +	/*
> > > +	 * A panic from an SDEI event or a pseudo-NMI may have left the lock
> > > +	 * held by this CPU. The CPUs that could signal it are stopped by now.
> > > +	 */
> > > +	if (panic_on_this_cpu()) {
> > > +		WRITE_ONCE(pe->unmasked, false);
> > If the panic didn't take the lock, should lock be taken
> > just like "else" path?
> 
> If another CPU holds it at this point, that CPU was stopped in the
> middle of signalling this one, and it will never drop the lock. The
> panic would hang on it.
> 
> If nobody holds it, there is nothing for it to keep out. This runs at
> the end of smp_send_stop(), after the other CPUs have been stopped. A
> sender stopped after it took the lock has either counted its signal,
> which sdei_wait_in_flight() waits for, or never sent one.
Ah. Yes. This is the key point. If it's panic and trying to do
sdei_block_siganl(), it's in smp_send_stop() on panic path. Thanks a
lot for detail explaination.

Reviewed-by: Yin Fengwei <fengwei_yin@linux.alibaba.com>


Regards
Yin Fengwei

