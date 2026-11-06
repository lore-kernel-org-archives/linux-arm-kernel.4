Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CAD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 20:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=damIHrIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=73dt1ns3WoQ1A4eVfdflZRp8nnX8v2Q1WwP7myyWitU=; b=damIHrIMwsiT+y
	YE+0jXP7h5rrhSHEBkKN4OGCj2cXBflnF7tXJNUnTZDaqN9WNuDq/d9WkAHURLO+WSp+EGCcwZAjm
	BTm50e+DMFsqD+u62l8wswke4tr6IJmU6WMyTr5ITL0roqTetIVvU6YyfKYFNlVgd3nVI20n04Qy7
	LDxHB+MwWBNuTiEgcabo32klqjrgfI6kznjlRMcADKzsFmkd3g+hA29Q4XFHLSMAnSm+F22TiE0OQ
	C//TvK/EsvVyaWHFlpQmswHEcOqPuBgebJ/ap0mHAlYrKll8duEDzjyhkF51ao+2+m2uIModccWel
	QRlFJfFGRaZnnU43Oreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQgz-0000000Dbik-0kD0;
	Fri, 06 Nov 2026 20:37:45 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQgw-0000000Dbhi-1szY;
	Fri, 06 Nov 2026 20:37:43 +0000
Received: from [192.168.2.104] (91.78.25.222) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 6 Nov 2026
 23:37:34 +0300
Message-ID: <1b4d1203-4af9-469f-9c20-52dfda499916@auroraos.dev>
Date: Fri, 6 Nov 2026 23:37:34 +0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pmdomain: rockchip: Don't log when of_clk_get() fails
 with -EPROBE_DEFER
To: Yao Zi <me@ziyao.cc>, Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, Midgy BALON <midgy971@gmail.com>, Finley
 Xiao <finley.xiao@rock-chips.com>, Frank Zhang <rmxpzlb@gmail.com>, Chris
 Morgan <macromorgan@hotmail.com>, Kevin Hilman <khilman@linaro.org>, Caesar
 Wang <wxt@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261105001257.1368266-1-me@ziyao.cc>
 <20261105001257.1368266-3-me@ziyao.cc>
 <71b77625-8475-43da-a62b-983cf572229d@auroraos.dev> <au2UvnY0CdGTRnum@pie>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <au2UvnY0CdGTRnum@pie>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_123742_493693_9113F754 
X-CRM114-Status: GOOD (  10.54  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/6/26 11:50 AM, Yao Zi wrote:

[...]

>>> Current error handling code considers -EPROBE_DEFER as hard errors,
>>> logs misleading dmesg like,
>>>
>>> rockchip-pm-domain ff600000.power-management:power-controller: power-domain: failed to get clk at index 0: -517
>>> rockchip-pm-domain ff600000.power-management:power-controller: failed to handle node power-domain: -517
>>>
>>> Use dev_err_probe() at the callsite of of_clk_get(), and check for -EPROBE_DEFER in places
>>> where its return value could propagate to.
>>
>>    To where?
> 
> rockchip_pm_add_one_domain, rockchip_pm_add_subdomain, and
> rockchip_pm_domain_probe. I think it's obvious in the diff and too
> detailed to the commit message, so didn't add them here.

   Ah, I was too hasty and misread the patch, sorry about that!

>>    And I didn't understand why you couldn't just call dev_err_probe() everywhere --
>> the error code seems to always be propagated...
> 
> This was what I originally wanted to do, but dev_err_probe() sets the
> deferred probe reason, and if we call it several times, the earlier and
> more specific messagess ("failed to get clk at index %d") get overridden
> by the later and less descriptive ones ("failed to handle subdomain node
> %pOFn"), which I think would make it harder to debug.

   Seeing it now, sorry again! :-)

>>> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
>>> Fixes: 6be05b5ec161 ("soc: rockchip: power-domain: add support for sub-power domains")
>>> Signed-off-by: Yao Zi <me@ziyao.cc>
>>> Cc: stable@vger.kernel.org

   Not sure the patch qualifies for stable though...

[...]

MBR, Sergey


