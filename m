Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDF4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l9YyPY6V;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NztmW3TC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ShyQmu0ddnJkdrSZothJXBYQH0ElJQ6+WmuFcfsJFK0=; b=l9YyPY6VNYtj5z
	awZoFenH88CFEA7jFFdHSZx/j1ur0A8T7Q5pTC4oMlRrXS1DUdAZM8R8Grf0DIRLh/oePx1l8SIJF
	Um6ZFBfnNcijefvrhKxcH9StCG9HiObhke7BFDDY1iNTTPEd74s602uwHygbSJV4MqvxW5P6V//ZX
	Hyg5hqlvyRZAG19PSNmgmzqLbUPqJ7P0NACdT5AR71EchQmeeeRZSxFpPrjbcVF9G26CNYTagD1ol
	JPvYk0S1DJpOX9UVqGyzqfpjTMs6K4pm9hIdz+SLmLjEDIb3CrWIY57n631cnYiWFzH+P/IpPH5cA
	VqGCkWk4WVyz1D7obvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWObM-0000000BpMU-3DS6;
	Thu, 26 Nov 2026 01:48:44 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWObI-0000000BpLm-4AGu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 01:48:42 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-9495c633eb5so358487885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 17:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795657719; x=1796262519; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShyQmu0ddnJkdrSZothJXBYQH0ElJQ6+WmuFcfsJFK0=;
        b=NztmW3TCk6i3yp1Wr2zxa218eBoghL/xmMDf3+W8SXwHvidxmZXVVQQYIq8vZ+lP1w
         HSMXk3I6iMepoOtD449o4JogvHElHd1p0o7DYAscRD8ikLXFH04dPZFL3XGUcGruHfEw
         CEoNOT31cpEHxvmf1Mq5TdMpuegjWfdbbKxLHvKequpPixhiAUuFJ58HHhoJayqmy5r1
         J2LoynunKc+Y2Y2aoIoruVMEbJY5O91tkBau9ygSTjoQ3o3cZArMMXJN+YN6VbsL1lbT
         ICAnyiaS/otCPHrR1h0t7ah4m+A9lTKCnFsMceRXaVAIiwEHuYUURJP/NlgVUnDusk3H
         q+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657719; x=1796262519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShyQmu0ddnJkdrSZothJXBYQH0ElJQ6+WmuFcfsJFK0=;
        b=Z1IgmgkFnYSpfycIM6dPtjmiT1OJtCAcKLyxRn5jigKg/MdnFgyO750M9LQRsyuJfq
         qNIGZtf3WyzXAARLtDL581hm1iEzQNPItvCtA5M1KZl+dscaRvjQKSCy2MGSVQ4XCBKS
         sAafPDzkqgCAEZqion2OkwrWAQGY5nhcHLo/rKmjE2d5k0OGFIExrbh34ZkyZBYqx6XE
         zFqdDP1euk5qe0FMh/P4WCo/CSSGAlnepkqN1uCtdtrWVy5dLoMIpWBnviZ+KIA4pqwg
         WQZHEyA3niOY6ISSfKdro59/QCsBsA+ReuOod+/ry4h1gvWcfblVPzq4ItVUCykGuclB
         NF4A==
X-Forwarded-Encrypted: i=1; AL+hErEkitcjfyZlSYaiC6LL4nkRW99R+cZYRrJg6n0W9O8XywxCGfkG95cmCAAymE1rn+IeHJ+de+B6YfR7I0ortCjP@lists.infradead.org
X-Gm-Message-State: APuU4Z+8npdWd5m1fUgvSHja0l1CddMCGd4eXXxGeslF9Lpku/cxcWPs
	oSXTFAm0aL3/Foseq6BchnFOYkNLF0b/g4EuXk/d29sNYnYTyGLq0q3q
X-Gm-Gg: AZFdTZftZo0KnXtMecGyVk6Cs4h1qYocf35dJwf7763dppTum0/KAb1svEMCtSj83NU
	L03FvPGYAhcYwZm6EFGCaxCuBrBee0F83MXEyKgoK5AyJSVskJjuHv50snDpaRNMlmub6fsFRzv
	HQipJp/J9vx8uWhZeYk9vhuINmZiMV96u/+hj5f2AelefvGiLeEHXCIyXqgUTGc8MlWxlvWjRmb
	BIYzgej8J52hQn8JlSyrzTwPEHksz6Jx363CnGQizDN68tpFGgGkgVocCLg92yQ164qhxkObBb/
	ZJUW+L5f8/t7rJXKJACFhUxq/kRcKaHF1eKU01byWyOj+zf21Mucahc4UPzOPtWccc/fU7JqbUS
	gaVXrywcZdmNWTHhpy0XUGQxCNzjDW1RAMyrA3ZlcMGevCClH+m2NxdVykHT73ZnG2MP9KHEzgv
	E2etxMWUoi6B/YCTbPjFHuQ8tTTh+GX6EjqEpo5+HUahAhVGbiXxw7CZbHBcJQ2h/si+IlKmVa9
	4lzEkYwTY4kS2PPDQuCk8V44FfvSilc7ybwf4/r9uq3j6vQFjp3FgbzqRJd3SWp0JAHi6ajFGru
	xOc9nYoa+CpcTP42YVx6xcJLnaDrldv+whX26Cweo6Lsi27e9ix2DCOFtGV9jJpLjkRS04icN9E
	JLpUr3ZFwyOr8ks8FbvPDr+1usOQ+q4WD+gTGpKkqVw5zmiYQfICb
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr3259261585a.73.1795657719106;
        Wed, 25 Nov 2026 17:48:39 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41c105sm1476099385a.39.2026.11.25.17.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:48:38 -0800 (PST)
Message-ID: <3167e5ef-920a-4e1d-ba03-bc928687577c@gmail.com>
Date: Wed, 25 Nov 2026 20:48:37 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
To: Dale Whinham <daleyo@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Dhruva Gole <d-gole@ti.com>,
 Charlie Garner <charlie@akao.au>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com>
 <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
 <CAFcmK8g+Udyp9h24WSEx2RepBA=rZpEQs==1hTi83A+_zF-GOw@mail.gmail.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <CAFcmK8g+Udyp9h24WSEx2RepBA=rZpEQs==1hTi83A+_zF-GOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_174841_040579_2C54465E 
X-CRM114-Status: GOOD (  10.27  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 8:04 PM, Dale Whinham wrote:
> On Mon, 23 Nov 2026 at 10:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
[...]
> 
>> I worked out something very similar as a solution. Anyways does it work
>> if we also add the check for non-zero dom->sustained_perf_level ?
> 
> Haipeng Lin has an X1P machine so hopefully he will be able to confirm
> soon if adding a check for non-zero sustained_perf_level into the
> chain still works.
[...]

Confirmed it works. Tested on Surface Pro 11 (X1P64100) on v7.3.4 tree
with this check

	data.turbo = dom->sustained_freq_khz &&
		     dom->sustained_perf_level &&
		     freq > dom->sustained_freq_khz * 1000UL;

Firmware reports both values as 0 for the two 3-core domains (not just
the frequency). I took a debug print of PERFORMANCE_DOMAIN_ATTRIBUTES

  domain 0: sustained_freq_khz=3417600 sustained_perf_level=12
  domain 1: sustained_freq_khz=0       sustained_perf_level=0
  domain 2: sustained_freq_khz=0       sustained_perf_level=0

With the patch all three cpufreq policies are created (cpus 0-3, 4-6,
7-9), each has the full 710400-3417600 kHz table, no boost freq, boost
disabled. Under load every cluster scaled up to 3417600 and drops back
when idle.

Please feel free to carry the Tested-by in the fixup commit.

Thanks,
Haipeng

