Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA15D606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qA390j6A;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EzT6VL+d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PvjHD5xBoQ0K8cdpA5aBSTc2W83sPTGK/ro8kbHtLgQ=; b=qA390j6Ac7RSK2
	T4LZSf4e8IMs3MraZ6hXu3OJ9mbUXQgIcpQc7oGxbwk386Dbd4aWBXRAWLi13Y7BYuHnNBFHDzOJr
	stkhst1Vx+MOuOtr/jzbNTJIId/JxK7b9guiIiCyxPSlV1HHyYhcYjXmUDGKVcMqeyHJEXHH0dxd+
	g+sidos31wsiZuO334u4vv3thFwxHIyLYHvQKvGSbpt9Z1Yi/snBwRxXkV/iylooMnjYxkipnRLnh
	s73eCAB9IbpvFbNYU5btTY//vUYacUC0FElyQnUODhU7SuwkBQAjAksVYumcfEKzVCwOqLMZjTu0g
	pjKWI9Pxj5ThdTyzENiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5NU-00000006KGL-3AN6;
	Wed, 11 Nov 2026 10:16:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5NS-00000006KFm-1Qv2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:16:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-49465892f7bso2170320f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794392184; x=1794996984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvjHD5xBoQ0K8cdpA5aBSTc2W83sPTGK/ro8kbHtLgQ=;
        b=EzT6VL+d7bpGglL2aTxLsCdjLLj6eev7T6SCkllZCvPcyLPcN73jVd3BS1ra8kWzIJ
         egAA/zOEzIq8JF3JPUD3Z3xnC4n2GjnTGdYxkO+9sXvg5wpAKki0OP8pyQuTVq68InNM
         Fg/RH6G50OJBfruzaz4ADcIPjNafMkdGRELCJ3AW8hFjTnxsgtmVXK8DEOsIKwi9XDpa
         QS1sabJWGyWITc3TyFq1xAtZFI/6mWuD8lE9DVQtdvRZK7+tUgjcgPkHurv3SzScdMyO
         SZlTfNcn/iTmQ2aA3gnMyuy+yWNPIoHNVGBd5qQObsqHJoEdYhxLd3mHyltjDXuehuUn
         Hm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392184; x=1794996984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvjHD5xBoQ0K8cdpA5aBSTc2W83sPTGK/ro8kbHtLgQ=;
        b=FLZrJLEqetgLl+3TTCadRLV0/etF6Aspt4wSDWXxh8KU0lahjERQqyvMJRFxJ0Ou0P
         CF0kbtDF/7DhmbIWaaqCGWlc9RgURenREot78Advf1PGpbQc/1nqtbK/ZvAzXg5Y2FKZ
         33FIKUmd1WHeHUqUrNgs+5JHwVLr30VeRsHaUl0xhvo0eTTb7WV05VvEh0NQ+k/22frU
         9Gn/y/2A/DSx2HP08gAHFvrnRvrMM5R9Rk+zd1HyMjMs2ub+2NQpTZwckFAs60unAT0D
         pMoc/eK4WidJtrpoDhTS35xbIGOPTxMZpY1jaNEyKULMKrRj5xsGLXnaso+vLVQjdtvi
         x+9Q==
X-Forwarded-Encrypted: i=1; AL+hErFl/uJeOMjMG34BMCRqStz9Kg1u4URKLvvWP9owMOs+6PtRV4uU+q4ihvbuJObX34GyXJ/bAQXAPrpi4h6lwsx+@lists.infradead.org
X-Gm-Message-State: APuU4Z+qWRsiW56NvTuXRUaIgyhoT+09VjI1cb5iymCRYsuyYTIpamdz
	C6UDPRceQAzHun1zx5gGZOPafj5u+284DWKsrSo25vbebTQ6x+YZM2E0V5EVsf8BdbI=
X-Gm-Gg: AYBFou2dXmLXhjfpPB1cZeMZZAjpy2tmFyq95srRFglXJsWGlmOZC+lYbw6NK/yOr0J
	eSuGblHhBgyw4tjdQFeHXNllVxH5zUghYNeHz1QfXBSOdOUsU5+SzZ11dtkbmEDwSrcNUcpT+Xl
	rLvHuLRVOgrK1cwy/G0FMQwZKKnlDMmuydy5hVdpKexU0Cvt9Iwn9e1IA479m7cql+A4Es5npQg
	qoNKPkbvS4wO3NIaKpqNreuUE2FHVYciBxi5gnMQdI82quAtA3T8poBa0jp9CxeaKJwMLlGZOx+
	T3v+6LS7cH4PjrZ1MIjm6kTEvnYOCUKzfYG9MD6VHTVoLO95AxpY8K3StRQZhCge6KkVGxzhejC
	PaGsJqMe9IfOU3ukyTW3V8U8hhQ3SWOTWb98SiRHQQSVs/2asuMN/AzeNUVVSyCNJqkIr3l3UK1
	B3WR5kLrJ00mpXWX2foiD25ot24vocfhXFHEIJySndAS4scAd+ukNFiirLUOimjzxct6M4KBUaA
	xjVjCNQ0WNg+BL+F7V8os4w040EjSU+2ENgXyBRHlMwx5ZrUB5tyEsGaHlxPRffkTDlekflQIEE
	lC9cv94O2JOKXJ5zkU0mclf8pAsZPGVXwNgB+eHxB/VqcihEDi9wk08=
X-Received: by 2002:a05:6000:288f:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-499c6cac56dmr3026544f8f.35.1794392184151;
        Wed, 11 Nov 2026 02:16:24 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c2793sm10054961f8f.45.2026.11.11.02.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 02:16:23 -0800 (PST)
Message-ID: <39ac224f-2903-496e-9a08-b4c5a33dc87f@linaro.org>
Date: Wed, 11 Nov 2026 10:16:22 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled
 PublicDescription keys
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: linux-perf-users@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 John Garry <john.garry@linux.dev>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261108183846.3804875-1-takano32@gmail.com>
 <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org>
 <179433972506.1746408.6665119010100304383@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <179433972506.1746408.6665119010100304383@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_021626_418161_A9B67648 
X-CRM114-Status: GOOD (  37.58  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/11/2026 19:42, TAKANO Mitsuhiro wrote:
> On 2026-11-09 10:24, James Clark wrote:
> 
>> Shouldn't jevents enforce some kind of schema? This seems like a bug in
>> the generator that it's allowed. And we have all the json files in one
>> repo, so we can fix everything when adding strict validation.
> 
> You are right, and there is a patch for it now:
> 
> https://lore.kernel.org/linux-perf-users/20261110193239.1741014-1-takano32@gmail.com/
> 
> It is not a schema, and I don't think it should be one yet.  It checks
> nothing about types, required fields or value ranges.  It reports the keys
> that jevents.py never asks for, when the spelling is a near miss for a

IMO I would rather have something that's incredibly strict and simple, 
or nothing at all. Having to work around edge cases and report near 
misses doesn't sound great.

> name it does ask for.  The failure here is that "PublicDescrition" was
> never read, so the field was dead in 16 objects and nothing in the build or
> in the tables said so.  What makes it cost something is the AMD tables:
> "BriefDescript6ion" is the only description those three objects have, so
> the generated table carries an empty text field for ls_inef_sw_pref.all on
> Zen 4, Zen 5 and Zen 6.  In your table the output is unchanged, because the
> value repeats BriefDescription and jevents.py drops the long description
> when the two are equal - which is exactly why the typo could sit there
> unnoticed.
> 
> I did not go the schema route because a table may legitimately carry a
> field for another reader: the Intel tables carry Counter, CountersNumFixed,
> CountersNumGeneric and Experimental, none of which jevents.py reads, and
> Experimental is read by metric.py.  A schema, or an allow list inside

But we can have a schema for json files that are checked into 
tools/perf/pmu-events/arch/ regardless of who reads them. The schema can 
say that "Counter" is valid as long as we agree that it's ok for that 
field to exist, even if jevents.py doesn't read it.

Then it's as simple as:

   from jsonschema import validate
   for path in Path(pmu-data).rglob("*.json"):
     validate(json.loads(path.read_text()), schema)

Where 'schema' is something like:

   schema = {
     "type": "array",
     "items": {
         "type": "object",
         "required": ["EventCode", "EventName", "BriefDescription"],
     ...

> jevents.py, would mean asking every vendor that adds such a field to edit
> perf's Python first.  So the set of names jevents.py reads is the only
> list, and a key below the similarity cutoff is left alone.  It will not
> catch everything -- a key that is a word of its own, or a misspelling that
> lands on another existing key, gets through -- which is why I would rather
> not present it as validation.
> 
> It reads the whole tree, not just the architecture being built: the typo is
> cheapest to fix by whoever reads that table next, and that person may be
> building something else -- this arm64 one shows up in a run over the whole
> tree from an x86 box.  The exit status is 0 for a clean tree, 1 when
> something was reported and 2 when a table could not be read.  make turns
> both failures into its own status, so a script that has to tell them apart
> should run pmu-events/jevents.py directly; for a person it is
> 
>    make -C tools/perf jevents-check
> 
> which reads the whole tree, and JEVENTS_CHECK_ARCH=x86 reads x86 plus the
> common and test tables every build reads.  I kept it out of `make check`,
> which is the sparse run over the C sources and needs a configured tree and a
> C parser, and out of perf test as well: tests/pmu-events.c compares what it
> generates from testarch/testcpu against a fixed list, and a key jevents.py
> never read leaves no trace in the generated C, so a runtime test has
> nothing to assert on.
> 
> It is not wired into the build: I had a version that ran it from
> pmu-events/Build on every build and dropped it, because a report about a
> table this build does not use would fail the build for everyone.  It costs
> nothing when it does not run, since the tracking that makes a report
> possible is switched off unless the check asked for it.
> 
> The two misspellings it finds were posted separately: the arm64 one is
> this thread, the AMD one is
> 
> https://lore.kernel.org/linux-perf-users/20261108184600.3810059-1-takano32@gmail.com/
> 
> The generated tables are byte for byte the same as before on x86, arm64 and
> the whole tree.
> 
> Written with Hermes Agent, an LLM assistant; the author reviewed it and ran
> the checks it describes.
> 


