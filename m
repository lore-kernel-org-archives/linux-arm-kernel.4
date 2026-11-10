Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78806606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yQ68qigX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdn67SHK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q5qW6t9RZikzPsIz5xM6Y9f/cfbt15VH92CdwgczBFw=; b=yQ68qigXfOlUZO
	qW2ldCsTJ9bGqHPiQvf0xJL/Y0Gc2cAY7yxKmVH7kxYRh7u9K39mUG5yXBcrK1DdSzskLDoDmncZY
	g7qdXNn1HEClZ7RvxkFz2BZ39X0iHOMNM+OYwMQGAOtRm2pCBuOZLWMQKQnhAa2Y7FDes1agvZn2R
	zyJReTPu9mloCubiZWczM4mNKHKJOZMTU1LKEYdd/PRA13AaXXLDvt3sZUf1iJvcVWP5KRybkBWG0
	WOaMXx4Pi1IMrQQKURLmk92WhZVX52tEjUcvD9A+ZmUl0t2ZQuqAjcgZgBmDAVmX9C3+w+WswXmUf
	CkpIXRDjNI7OtcY6llIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrjP-00000004vyw-3QQY;
	Tue, 10 Nov 2026 19:42:11 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrjN-00000004vyZ-15q2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:42:10 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4796720eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339728; x=1794944528; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5qW6t9RZikzPsIz5xM6Y9f/cfbt15VH92CdwgczBFw=;
        b=pdn67SHKWy2xcALraxbMrPydu5rFfEIwfSObHFKAT4BXDQlxVqm1FRDBtnBeN7zIpl
         4RVkOnKRjJcUN79ICauUe9wnT4Bj1QvTr93SHuC6oPcYl7oKrj602YtJWj88efyWF6q8
         5s0SMN9tUVfIkywFxT+2DnWpOo+FDMW44s/8iVZZj1JvwEiHhWIWU2UvXtilaLxnm08j
         oJ6O6dH672Q8tpqajhkgWp073EY01dHtDVm6kCCwcV1VeC3vHWWsrSARFiRK/cla2ZNn
         iShDlx70GabkI5yv+EUrHRSXV5XH0zGGW3kEdnEmzylZ0aTeemEltOKFguz0n7a5JgqP
         lIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339728; x=1794944528;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5qW6t9RZikzPsIz5xM6Y9f/cfbt15VH92CdwgczBFw=;
        b=fJmUdEsACHNRS5e2Of5Rl2WpUy0lwyxcZLnIiRD2vBzW1x92sCzj1nj/MEga3H9j9W
         +Se/0rkw3wZCmCDHx7TP9vJQXVkXCeL0TlqVYyTPf89XK8WeEL9+7OTAg7dxvskk4Wsw
         DZoWofMonYGwbUJ+7nPyP9Mvvxw6NblF1P2Y/7wLQWGGctzPWur9XOWL4uFGBIIzI6WW
         KNiL2zQicrJcR76La2DXFPFXy1sh07wchgQqzGOOCihLhk5vVU6mr8XGvoubZ9rFDQEt
         a6/qIXTq6A6jokM0X1stiXMYSd0mVRi0Z810To4KSkbjmZLpaQUSLlU7n/X7b5591Ijh
         tHtA==
X-Forwarded-Encrypted: i=1; AL+hErELb+8eenrIJGsdGIoNCn2uiRqffr50QYoe0JtAB9crsarTUVpJU3JYsOy9oGx4gRAsoIL7qz2tiBka2gsZPqpj@lists.infradead.org
X-Gm-Message-State: APuU4Z8SzwVmam8wsVBxBKrvbMLszAYtSdKRNtODVxJKzn3IichkHpcn
	5Vksj7revruP5u19crN8kM2Txh5lRUGK5QDSBUVDQmioEIm3yvqf6mPc
X-Gm-Gg: AYBFou06lbbBNW4XkrMTwY0VcpUcmXkFkRq8lPx33I1LGUPNglxwVwuOZkQk3XgdjBe
	NSp32zjFAq5AU+g7XFwsKgL7jBB6HPeBN1hFJxka4eOx1yiumsXpzlMW+cO6gzOsUMBRDuewbI6
	XN5JTw3v6zeq81LFa7Yz3cwGoZY46ybn9d6Yj294mkyAb7060OVqcVWAsj8QE9GOEw8/WyFoQm2
	+9X9YNyHRrnHs+73JosURYluOVi1OGXsYd9acqUX+uk/+GxYrm3mLeQWDPeq8irxmarlt7m9wXW
	ZM9/qMaDmyrmCB4AA7CDyjfU63T/+g/t1nukif3YlzZmd+sf7kTFXWyvAC5aacjg3v4SbLTgjIA
	cOVvkJDPEKFptaV61wOafIa0lDx21FbRqigDN+7CA400IqaxaqbBQ+jHLlkFo+ldXITqwSUmH9n
	2O+AwI9SPAZvz+F0LUvUcOjhk+wpnlw5+oMD3PGWwslsJi4NmSH5pVFSDWGbKp09ncFxUU5OhH3
	YDWmm2kMcxMeptcBjS6bPsfJ+rQIjvASaezXWYM6clt0R2/rGDiiyTmAs8C2JMozzr7L4HLWmIP
	Cb6+NBaXkCBnfTcA8fW5atgDyw==
X-Received: by 2002:a05:693c:62d0:b0:36e:535c:60b4 with SMTP id 5a478bee46e88-37685c7a5a3mr308597eec.13.1794339727953;
        Tue, 10 Nov 2026 11:42:07 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe3261csm7825076eec.4.2026.11.10.11.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:42:07 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Tue, 10 Nov 2026 19:42:05 +0000
Message-ID: <179433972506.1746408.6665119010100304383@gmail.com>
In-Reply-To: <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org>
References: <20261108183846.3804875-1-takano32@gmail.com> <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_114209_305765_D308595F 
X-CRM114-Status: GOOD (  25.55  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-09 10:24, James Clark wrote:

> Shouldn't jevents enforce some kind of schema? This seems like a bug in
> the generator that it's allowed. And we have all the json files in one
> repo, so we can fix everything when adding strict validation.

You are right, and there is a patch for it now:

https://lore.kernel.org/linux-perf-users/20261110193239.1741014-1-takano32@gmail.com/

It is not a schema, and I don't think it should be one yet.  It checks
nothing about types, required fields or value ranges.  It reports the keys
that jevents.py never asks for, when the spelling is a near miss for a
name it does ask for.  The failure here is that "PublicDescrition" was
never read, so the field was dead in 16 objects and nothing in the build or
in the tables said so.  What makes it cost something is the AMD tables:
"BriefDescript6ion" is the only description those three objects have, so
the generated table carries an empty text field for ls_inef_sw_pref.all on
Zen 4, Zen 5 and Zen 6.  In your table the output is unchanged, because the
value repeats BriefDescription and jevents.py drops the long description
when the two are equal - which is exactly why the typo could sit there
unnoticed.

I did not go the schema route because a table may legitimately carry a
field for another reader: the Intel tables carry Counter, CountersNumFixed,
CountersNumGeneric and Experimental, none of which jevents.py reads, and
Experimental is read by metric.py.  A schema, or an allow list inside
jevents.py, would mean asking every vendor that adds such a field to edit
perf's Python first.  So the set of names jevents.py reads is the only
list, and a key below the similarity cutoff is left alone.  It will not
catch everything -- a key that is a word of its own, or a misspelling that
lands on another existing key, gets through -- which is why I would rather
not present it as validation.

It reads the whole tree, not just the architecture being built: the typo is
cheapest to fix by whoever reads that table next, and that person may be
building something else -- this arm64 one shows up in a run over the whole
tree from an x86 box.  The exit status is 0 for a clean tree, 1 when
something was reported and 2 when a table could not be read.  make turns
both failures into its own status, so a script that has to tell them apart
should run pmu-events/jevents.py directly; for a person it is

  make -C tools/perf jevents-check

which reads the whole tree, and JEVENTS_CHECK_ARCH=x86 reads x86 plus the
common and test tables every build reads.  I kept it out of `make check`,
which is the sparse run over the C sources and needs a configured tree and a
C parser, and out of perf test as well: tests/pmu-events.c compares what it
generates from testarch/testcpu against a fixed list, and a key jevents.py
never read leaves no trace in the generated C, so a runtime test has
nothing to assert on.

It is not wired into the build: I had a version that ran it from
pmu-events/Build on every build and dropped it, because a report about a
table this build does not use would fail the build for everyone.  It costs
nothing when it does not run, since the tracking that makes a report
possible is switched off unless the check asked for it.

The two misspellings it finds were posted separately: the arm64 one is
this thread, the AMD one is

https://lore.kernel.org/linux-perf-users/20261108184600.3810059-1-takano32@gmail.com/

The generated tables are byte for byte the same as before on x86, arm64 and
the whole tree.

Written with Hermes Agent, an LLM assistant; the author reviewed it and ran
the checks it describes.


