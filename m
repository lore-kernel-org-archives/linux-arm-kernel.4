Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952A9606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2N/xFSZK;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BjtOEiZy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iyeZf0XP/ze98T3O+lqqi7V4HOHfHGgZqjL9qn1bdgw=; b=2N/xFSZKp+GZpfN0020RvaUzeP
	AvoDui8OpLjlh9WtVb91vzqYaty7sTjhSYxOX3RZ80JfCSm2WabX+eGtdlr19fhnOP50+p6WhBHS/
	ErEePvLW4L/r9tceQdj7kA423CIb1vYPc05/YnWj6d28cBQujJ0EJ05Yvb3RpnT2AquwJtJQH+N2E
	FYQODIITPgq1FC64wP5WX0JdEsJAL6ZtMh53IHULx5HoeFSwjHkS4Z6MpinWG41+5TxW1dgIf4wSH
	k12yw2vx4jsofHSTELhiVnIxanl3Fzivl+X7geCN8WikfhhAFMIvWidRBe6fi4zcuiWbyTApZ2yQ0
	EI0oRHIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9fr-00000009NgC-3OVn;
	Wed, 25 Nov 2026 09:52:23 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9fE-00000009NOK-25Hr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795600297; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=iyeZf0XP/ze98T3O+lqqi7V4HOHfHGgZqjL9qn1bdgw=;
	b=BjtOEiZyfLncJ7SGuesfw0oRrIMyEMbeSruAxcYnktTOTruziroY/0hdljj54D38imLm9ihSUrjFoRz13NdIZqt89vLTEh7/2KRSS7IBz4rg+B/jst4T4lv/RCuR40rGgQyKmxeG/reIe2eRl/sDGveP/kTCK+P6PW8hzGDu3J4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fengwei_yin@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XFRAeva_1795600295;
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0XFRAeva_1795600295 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 17:51:37 +0800
Date: Wed, 25 Nov 2026 17:51:35 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH 2/2] firmware: arm_sdei_nmi: Send the backtrace IPI to
 CPUs with SDEI masked
Message-ID: <awavp9a_33NX7rtJ@U-V2QX163P-2032.local>
References: <20261124194707.1030653-1-kas@kernel.org>
 <20261124194707.1030653-3-kas@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124194707.1030653-3-kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_015144_705922_2C4A51AA 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 24, 2026 at 07:47:05PM +0000, Kiryl Shutsemau (Meta) wrote:
> sdei_event_signal() refuses a CPU that has SDEI masked. An NMI
> backtrace then gets nothing from such a CPU and, after 10 seconds,
> reports it as not responding.
> 
> The CPU is in a power-down idle state or going offline, and the regular
> backtrace IPI wakes it. Send that IPI to the CPUs SDEI refused; every
> other CPU still gets event 0.
> 
> A stop needs nothing extra: smp_send_stop() has sent its IPIs before it
> signals SDEI, and a CPU still online after that is reported as not
> stopped.
> 
> Fixes: 0c2c56598cc1 ("drivers/firmware: add SDEI cross-CPU NMI service for arm64")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Reviewed-by: Yin Fengwei <fengwei_yin@linux.alibaba.com>


Regards
Yin, Fengwei

