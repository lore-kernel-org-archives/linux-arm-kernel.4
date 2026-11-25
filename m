Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85935606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZIsbpK/2;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dGkil6+B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XMNffF9gfExpM/riFJmEIEYf1Y6eQwranys00FqUlgs=; b=ZIsbpK/2gk3Zhr
	oah9IHBDy7prARagRTQ9rqne/e/mRdVQ6zZ0AHkrWGGe9EhqugwkYIPJ58MEoAhaM9IYGIwmrCEjj
	ndA04kCJMWIbzWNtPcz/4K+/0s3OWQu6bsFsl2+kI1dTRL6G5SyxeHspnE54yeLRnriyCHz6mUh5f
	+pfZ5Np2BCqZxAN5ap2QeZpwlcEnHvPNafPSC9dzYplnPaqm36UbOEkKdMKVN2WwKcP1oZOwYJP1v
	+VcS56zI5YwKnNe1a5x9W+UB9zbd7wEZ0+UQ1xmrxSGTbGDbvx2qygIAs+SAcOvq/XLlpa2N3fvCJ
	Qfjm0Pi6iZmkK1qXLTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2np-00000008Ex3-2pdo;
	Wed, 25 Nov 2026 02:32:09 +0000
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2nl-00000008EwA-34K3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:32:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XMNffF9gfExpM/riFJmEIEYf1Y6eQwranys00FqUlgs=;
	b=dGkil6+BLq6/4BT9/ArxX1A3ieI6i2qk27rpbInV+DAeN3tZoglWZgUsp5pqnCqTR2le33TsC
	3fr0MaLOl2NO57PlvTcOrkdkDTLh8sG4GDDA7kFCaHPxiA1ONSHhKHA0QTyNxlwSA5RWQzH/1/9
	2aYozE+ZEFnRVMfpaqBY/Ow=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jZ3ZT4NFRz12LkH;
	Wed, 25 Nov 2026 10:30:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id EC74320333;
	Wed, 25 Nov 2026 10:31:45 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 10:31:44 +0800
Message-ID: <ae1f4fb2-7027-47d9-8981-6b3e2946f6ad@huawei.com>
Date: Wed, 25 Nov 2026 10:31:44 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI
 path reachable
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <bp@alien8.de>, <jlayton@kernel.org>,
	<catalin.marinas@arm.com>, <sean@starlabs.systems>, <will@kernel.org>,
	<jonathan.cameron@oss.qualcomm.com>, <tzungbi@kernel.org>,
	<steven.price@arm.com>, <chenhuacai@kernel.org>, <tzimmermann@suse.de>,
	<wenst@chromium.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<vladimir.murzin@arm.com>
References: <20261123033222.1067923-1-ruanjinjie@huawei.com>
 <awXQtcWmqf7c_49B@shutemov.name>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <awXQtcWmqf7c_49B@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_183206_546700_ACE2A8DD 
X-CRM114-Status: GOOD (  10.59  )
X-Spam-Score: -2.0 (--)
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

Hi Kiryl,

在 2026/11/25 2:12, Kiryl Shutsemau (Meta) 写道:
> On Mon, Nov 23, 2026 at 11:32:22AM +0800, Jinjie Ruan wrote:
>> While the SDEI cross-CPU NMI is active it claims every cross-CPU
>> backtrace, so on a platform whose firmware exposes SDEI event 0
>> the irqchip NMI path can never be used.  There is no way to opt out.
>>
>> Add a boot parameter "sdei_nmi.disabled".
>>
>> With sdei_nmi.disabled=1, the SDEI NMI stays registered and simply
>> declines every request, so arch_trigger_cpumask_backtrace() falls
>> through to its IPI path and smp_send_stop() skips its SDEI rung.
> 
> Why keep event 0 registered and enabled when the switch is on?

These original codes are left for testing the IPI as NMI function.

> 
> If sdei_nmi_init() returns before sdei_event_register(),
> sdei_nmi_available stays false and both hooks already decline.

You are absolutely correct. sdei_nmi_available itself can block all SDEI
operations, which can simplify many things.

> 
> Then the flag is read only at init and can be __initdata. None of the
> other hunks are needed. The check in sdei_nmi_stop_cpus() is not
> reachable anyway: smp_send_stop() calls it only after sdei_nmi_active().

Yes, you are right! I will update them.

Best regards,
Jinjie

> 
> --
>   Kiryl Shutsemau / Kirill A. Shutemov


