Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D244606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JLRLiB9R;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BQZ5/VqE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WO07T3iwpJzHvxuO/do8IZbWSn6dr9c2S7mcJrXY/DQ=; b=JLRLiB9Rwkl/RP
	2JVx/Pmr6dNNiTexMajzhv9JBd+JGOMcRo20gq56Ok5gsXI1KFHw9bZB/l2ZhrxBb0zY05aDk9p7z
	lrMLuAX/N34llGifz7NyiRvP2063o041/1giefizAqYBcyBOA/P0AKhBEY047GMa8JzHxVDiPVg1l
	an2zu758ankeGRPbU6IkaE0A41Dbu0yUpJM+vnYf/h1Zji6itq6IlTgtR6hr7D24KK5RBFlXnaYZO
	oczzXHUjyN32mNZr0q5qaM0NZHdcXpcD4gnX8Wlfwq+4ZCdSpTR7j97lygHzP6AOnvDEZ/lVxKpIM
	a01RZenESLU7c+VCyNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNPr-00000000VLt-2X0y;
	Mon, 09 Nov 2026 11:19:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNPp-00000000VLE-09B5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:19:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-49318428d98so378634f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794223195; x=1794827995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WO07T3iwpJzHvxuO/do8IZbWSn6dr9c2S7mcJrXY/DQ=;
        b=BQZ5/VqEUOj4NilPoicN72UXUOHfn4ZNnS6nnoxsVQ07/XPbIAh3qpgzeo5XmygflF
         9gu8SVGNcdOdsXBczlCOS0bjdhJAoLlnw6rdyahzEFVITmiRAtbr/saB3++8JzukisLw
         4257yqM3Qk0ksTil8kXnONMehq83KbE00xg7fBi3Kwspn52qZk+WSjzDEwEAcGN8ESdk
         WfLfiu1q2R/ERViiV0XAa1JHzLnEatVGgrCWaGhA6xQVv3hIMhRQsd4q83y3iRUNIADo
         +7eo1ML79sH42SMuNggzjoG4E3oGw97N/EkIPRWzgApECZcL/NqneBMeGXTjokOM7yoa
         PqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223195; x=1794827995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WO07T3iwpJzHvxuO/do8IZbWSn6dr9c2S7mcJrXY/DQ=;
        b=B6cdIAxMwkgFhh52T7bo6uHWc2VxYhI+svYSejPGbgNq5ft5nKZZ/jjj1Y8Z9nov/h
         QBByp7cuaoG9zTSbBdwlFjGtlFKKWIPwM3NGlTebuZ+W8MbPBENn3CNLnIOyNEZThqmu
         GBBunkDu15SjtuF6BRMeh3+HHY28H2HRq1+dyjDDxmO57vnMOX6hl/OyCOroZHp5AJs1
         OuS3RWaJYi/N9ZSOJRD3oi6MX83nDNDgPlPjp35iednMrIW056Xk1i03dQCxvwFsfdXj
         bUFCvbbi0npnQt31OJPGZtLBvr0UjHPqOaQj0mB0dOFF0u+WuNUpXYnXriHnS5iMY+6T
         rSjw==
X-Forwarded-Encrypted: i=1; AL+hErEtRxx2w4y2SVPO4VBtBGHCREHJOFwqC/VU0dgCUDAX9nwyo3kLPj1SF+gciu1P0/FGcKgWBGikm12ivvVqFO7f@lists.infradead.org
X-Gm-Message-State: APuU4Z9paMnPu2USgMThmTLggfK5icWhK3mJvkbAyjmCE6awzh/p4ays
	61xc5uH/OFoyIoaihrVsCURYO3r+AIHxVV1+xsKTEnEqUyNWsFDq/6q8+Vsr+Ma9jDI=
X-Gm-Gg: AYBFou3hueheMmAhvz9FEJ7G1BCpYsMbWuES7GjE5LY8v3nZoXYnS+9mpC4HolKhruc
	2YvFgQl4z+hedQGetfdbOy9kevdAI6tsa5uE9YqMB/u8iHPPOg9BJUHYHZXRA1QkA4PSToqG/i6
	qZUlShOjkwiAGeaaEdqLLYFhFaUF1qtrYn1JAOw0HoOSUDRAqzvqcWD3jPfNpfwrk5ZWi70UBup
	t443+o32Hd+xNL5bzhhLkZv1DzwBvwOuk9lB/uE8eOQFGGjBR6re6clVQKg20cMrR5IyPtuK12z
	gnrvzfmMHYG+yMfNM6SgJ4QKsYiBy1xB8wDUbQ6SF1ThJk3uG8SMIVNN56rOndRW+Ir8qRUoTT6
	ymxXlh17BbPpNVqarOavo5XxRneINkpRbgwHF90FMIAyxiCSp1Szxlpg96Th5An2/UlwO29BO5M
	4P+cYE5kW8psD0cgWNw9qSPiNPo7Xk9g1b4B28aukEgBtXRxU3sOLL3OsS7shbt6Z43uREmXIO3
	ubBNYUmjVHJlC6hqcKvGehyRSZdV/CZP/hdflULPkrctvuOHPtTei+frY7yniy5NGuYcq1iq+da
	kyXFHMAPYeoWG/OBUGJRhPFwuiegIlYe
X-Received: by 2002:a5d:584f:0:b0:48e:76ab:7906 with SMTP id ffacd0b85a97d-49588622039mr7484276f8f.9.1794223195052;
        Mon, 09 Nov 2026 03:19:55 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783e39esm9142819f8f.45.2026.11.09.03.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:19:54 -0800 (PST)
Message-ID: <1baeb4ec-4244-42e0-8c53-29df079c80f6@linaro.org>
Date: Mon, 9 Nov 2026 11:19:53 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: perf: Fix the userspace counter example link
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20261106234551.1474417-1-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261106234551.1474417-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_031957_143073_BFBF1939 
X-CRM114-Status: GOOD (  31.77  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 06/11/2026 23:45, TAKANO Mitsuhiro wrote:
> Documentation/arch/arm64/perf.rst points at
> tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
> target, but the file does not exist: no file of that name is in
> tools/perf/arch/arm64/tests/, and no commit in the history leading to
> this base has added one.
> 
> The userspace register access described in this section is covered by
> the "User space counter reading of instructions" and "User space
> counter reading of cycles" cases in tools/perf/tests/mmap-basic.c.
> That file is the only in-tree userspace test that walks the core PMUs,
> pins the test task to each PMU's CPUs, and selects the PMU by its type
> number when the kernel accepts the extended type.
> 
> perf test -v user runs the four cases in that file; the two reading
> cases ask for user access through config1.
> 
> Point the text and the link target at that file.
> 
> make htmldocs does not fetch external links, so a plain documentation
> build does not report it, but make linkcheckdocs does.  I checked that
> the old link target returns 404 and the new one returns 200.  No kernel
> was built.
> 
> The edit and this changelog were written with the help of an LLM
> assistant (Hermes Agent).  I reviewed the diff and the reasoning, and I
> am responsible for the submission.
> 
> Fixes: aa1005d15d2a ("Documentation: arm64: Document PMU counters access from userspace")
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>   Documentation/arch/arm64/perf.rst | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
> index 997fd716b82f..236cb5da425a 100644
> --- a/Documentation/arch/arm64/perf.rst
> +++ b/Documentation/arch/arm64/perf.rst
> @@ -140,9 +140,9 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
>   the corresponding PMU instance is opened by specifying the 'type' attribute.
>   The use of generic event types is not supported in this case.
>   
> -Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
> -can be run using the perf tool to check that the access to the registers works
> -correctly from userspace:
> +Have a look at `tools/perf/tests/mmap-basic.c`_ for an example. The two
> +'User space counter reading' tests in it can be run using the perf tool to
> +check that the access to the registers works correctly from userspace:

The section above already says how to use it, and points to the libperf 
test as an example.

So this extra reference isn't necessary and is in the "About 
heterogeneous systems" anyway which doesn't make sense. Unless it's only 
to show how to call sched_setaffinity(), but that's not really in scope.

I would move the sentence about how to run the test into the "How to" 
block above and delete the sentence about user-events.c. mmap-basic.c is 
also a very confusing test IMO so isn't a good example. That saves one 
reference going stale again in the future.

>   
>   .. code-block:: sh
>   
> @@ -160,8 +160,8 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
>   and should be used to mask the upper bits as needed.
>   
>   .. Links
> -.. _tools/perf/arch/arm64/tests/user-events.c:
> -   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
> +.. _tools/perf/tests/mmap-basic.c:
> +   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/tests/mmap-basic.c
>   .. _tools/lib/perf/tests/test-evsel.c:
>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
>   
> 
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee


