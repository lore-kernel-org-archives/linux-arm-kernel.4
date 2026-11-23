Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF36606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GPa0lKzz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=At6vpgGK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n0IwwoqFU6FYET1+Z3QIMppXO+y0FM/vbWz+JBZFbWE=; b=GPa0lKzz81iZekfDRqT2xJyZRD
	WVVO0eZRqq06A7+jAxXb/2GTg2e7LpS/NXUqqQ1pT6GgS/Zed7l5zjD6PMdgjzb6Q2Vuns6ZDg+Bl
	ifQ2tR06Om+uzjz5TI8+dsq8E/6g5A6tt+7GLciZ0MCABF+C+gGF51rLnMouJaE2yB+6QPQtg4nXP
	D4FBjtnQ8fVgKEuJuP3zafO86ky3vT7CegT9Y3PB3fhXfy4jNtcwP43KU3lfGe9TIzVfKBcC+s/EQ
	uedM/Yf0Pt3Cly3hik7Laqd9nND1IKde5McwKhrETezGcKMZQqkeQpdGz6ERZrdi3hcl5URrS7vGN
	OP4+zkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS8S-000000039M8-3lTz;
	Mon, 23 Nov 2026 11:23:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS8I-000000039Cg-3nMH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:22:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC704143D;
	Mon, 23 Nov 2026 03:22:44 -0800 (PST)
Received: from [10.2.213.11] (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10F1F3F882;
	Mon, 23 Nov 2026 03:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795432967; bh=spxzXW2OAk5CItHqRFUtJkcdrfpendqQ9BF7EJiu/T8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=At6vpgGKMWCyKi6xz7wozWpbTAsICd/JDM8ODxxn+EqAGfINNHT17Fqbj5fYXLnTT
	 BdX/ekTVgY+90zs0uA1XokMynVI0RjL5yRVvbmM3224BaFbCCr9oREppwaSp5wDch2
	 Y7WIJkB0J/gnDA1KBm4UBigSviIq2Mw66oqQJzHo=
Message-ID: <fcd485e2-8d43-4eeb-b686-012f352ce736@arm.com>
Date: Mon, 23 Nov 2026 11:22:38 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: entry: sdei: always set VBAR_EL1 on SDEI entry
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20261117174814.95936-1-ada.coupriediaz@arm.com>
 <20261117174814.95936-2-ada.coupriediaz@arm.com>
 <av8p2WL4R2tlU1HX@shutemov.name>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <av8p2WL4R2tlU1HX@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032251_179764_E7D3B348 
X-CRM114-Status: GOOD (  12.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Dawei Li <dawei.li@linux.dev>, Marc Zyngier <maz@kernel.org>, Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kiryl,

On 19/11/2026 16:57, Kiryl Shutsemau (Meta) wrote:
> On Tue, Nov 17, 2026 at 05:48:12PM +0000, Ada Couprie Diaz wrote:
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index beb56891fc4f..cb122163a68d 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -1079,19 +1079,22 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>>   	far = read_sysreg(far_el1);
>> [...]
>> +	 * Switch to the kernel vectors unconditionally and restore
>> +	 * the interrupted VBAR_EL1 before returning.
>>   	 */
>>   	vbar = read_sysreg(vbar_el1);
>> -	if (arm64_kernel_unmapped_at_el0() &&
>> -	    vbar == (unsigned long)raw_cpu_read(this_cpu_vector)) {
>> -		write_sysreg((unsigned long)vectors, vbar_el1);
>> -		isb();
>> -	}
>> +	write_sysreg((unsigned long)vectors, vbar_el1);
>> +	isb();
> This makes the comment I added in do_sdei_event() wrong: it still says
> that an exception taken during a KVM world switch goes to the hyp
> vectors and hyp-panics. Could you drop it in this patch?
Ah absolutely, I missed it, thanks !

Will send a v3 with all the little fixes.

Kind regards,
Ada


