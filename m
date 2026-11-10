Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B07E606B160
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OAUTF8KJ;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=md3t8udw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YhvIJXuyquHMGSngmZ4O4PsxJ4Wvcj08h08CfdMbZgg=; b=OAUTF8KJi6vB9mCp4NfE2/lukQ
	Uf7WheNPVRn7cz4J6ZJu61I7/1r+ravdyJN1d9Zitizmcg/69sAQeMTgQrVPnKXNyNeEDjIBC1AyR
	9FoH/7uxvFjQs51jaQhPKMPlVP9BwQdPwSXrrKdOYpOJOEoISfooDZJxhS+et0bmz/gm6zyOHXSlg
	dRyUdL0Mh87HnesQI8MDhUP7DnfwHISkSZjEQncPJqit2lqEKl5aFhSCue1YdFQhsvwGgOjYiMZsF
	3+yHrwar9ECEZF0W/LEpwp8z94j97nPNY+aFYBrxzwG7kM5Jjq+CtEMm7WH0wP/of+mHWbR9ydXb4
	/CIUHcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi6S-00000003G7q-1IEK;
	Tue, 10 Nov 2026 09:25:20 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi6O-00000003G78-33NG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:25:18 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-91ecbdf5343so20831376d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794302715; cv=none;
        d=google.com; s=arc-20260327;
        b=S/34s4RreyQnM9Z9dNGdBBBZSqT1tvImfdQw7cDa9PH5dt7TuFZABk/+U7ULYU2RcV
         zzrdnPLVs22kTpYAjYwgilqGhOfNJMpjRNtUKt4W7NPrGOn9SJyBnfu2zNzutNjs3Cl4
         Ild0oRtZ/NnqpnaprJ9gtKb7s+AW9ejCtBnG6cwkm5nF1rvANgUu7XtYCCiDovvfe/yU
         JTD2CZ1aupcjhSa4R9Jj7ik9LOT7IfcyEs8mdB2KsSpXUYrmYCGuNra5c3zdaRe43/ZK
         rOP/jYjwc8h6G22idUNDDL47cCsZMnq2vxPJnovkuMSERMRZWFoihUiWZ1zg9cLqp1Il
         xm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YhvIJXuyquHMGSngmZ4O4PsxJ4Wvcj08h08CfdMbZgg=;
        fh=LD5xboAvAm5LTsH4nHJbIXiY22IdsMpUCV40d9ruqQg=;
        b=RPOgrWwHTIlLMD6WlNFap4LQlk6LmesujkpfyE+B1+0ciM385GJWIti5ucInVUYS7Y
         zTUAh/2BCE0lrQ/pwGZsEfEgZPjC4aj92XbbJmlGByJkfm1DBW8wLJAD0WTfiyj4Sf5y
         Si1Uj1ecqTjY9OGd8KI3BSHpcq7dmV76oUA5+PeSeNe8YJO5IbtyglPSMx6PUmTt9Y/U
         BqFy//xPMDFwEAI6J56aWj8tNDo1kb2/Q4Nzq/hgVv6Cpvn6v2jJDv79aFnxONsjzggm
         wPXvJCdBo/2vcwU/oKVTECUGfwogNEEUnZXXPCFhRRa0QOhynTCk5WrvuRuUWzQoroHa
         Rn2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1794302715; x=1794907515; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhvIJXuyquHMGSngmZ4O4PsxJ4Wvcj08h08CfdMbZgg=;
        b=md3t8udwjKxq/kn8kDV4tf2zUrLIVbagXhhxfZ1SM4aW2+ZLVIe41P10YHOyeaHihF
         54h9eT0Vvr92jVjvHwL861O7OrhYwIHNkRwGzCDeEnorvTATxYsvQtBRzVaAQtJKQH6x
         wMGU4ImhKfQDqzppiJibcQEMLw79yiUhglCldtTJ2b/Bu0rHE+cuHgHz8L64PxuND7ch
         zFM9WNMeVBX/t5LSDP8F1oZnB4lsvH+f9NOSQNqk1HMLVk5gXgk5nxP9D/z7HThc9rjN
         qA9Ka0x9IYtVaWhXJjSEmu1zu6I7su3pF8ZrxhqWWV38QYr/NBfXYnlWRFqDAjeI5X51
         hg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302715; x=1794907515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YhvIJXuyquHMGSngmZ4O4PsxJ4Wvcj08h08CfdMbZgg=;
        b=E39aVlNjzwyckpJtYafWu21VrGJ7YT9vBIoIKowiv8A8xHnGpQ1bl7aKp2+xtoL3sG
         5j34Q5gFEgdS2tDQIQzhbsDomvzXYUiaPySDMhmUssxx+wzG3Xx4ai0fPjn6cVQ2DgzS
         pzstfNnc8bqS+ftphe7NTpZLNIQhIf6GfKl7LFfzkiGIoBI58Iq8tZAS9bGikRgAwSD2
         2A82r9FjR8lpnKkMoBjJ5epCUcGyY7E+H3PvtfFpSrSsVQNNKFkFn1tzfouvFW77Xsjm
         JP0mQuLWOr26zNhMtVGhosjtrfvvMkiNxsgzj12K1/qbr4Cf2CwGIUYfYHngeIQS5yCi
         G6RQ==
X-Forwarded-Encrypted: i=1; AL+hErG9EzQdHr3fqnUPrc0mxoiw96Po+TQTqwKAWpMoc7MdRf7nOjpUSxTbM9SFgqZlUIWSRjEMPkW1FOE565m66Qdd@lists.infradead.org
X-Gm-Message-State: APuU4Z+0mclOs0DUfv/f4/E6WaD1I8p7hlGsO0bbQO4tuXNDns7HwkIt
	HcUy22EPwmur8K/RxXmqSeMKVEtH2XmZysnO5CyfmxHw+WTYaVrfnrgueZQveJbGALScKfkKKlW
	EUN9Vf9Mlk7qQZQwzCKjg6NtZEsU/jzQhm+fz8S7zFw==
X-Gm-Gg: AYBFou0xsXZnzxZPAaPTCA49WCvmGnYUPcTqSy2wXX06IVvfDqV+jM10SP0+SZnhRKW
	By1p0ACHbJeQSdGoCSpH7YCpspuvZ9bGivwhcuZa7d9N6zBGB4+ugdeXNXH17Ku0JtqRA0LWWdP
	K+pzFsT7mFLduaoP54xedFy1MGqPk5qpZs7OMwuLd2AwHXrpBxpbeTNKUziUH86pPZxijE87C5Q
	UUg9MHGqHyUK5dCbDjGMq++cDWeRBT7IWEQZOvThn2+evS0wTylDNzBT8oH0e7fAYegxg4VUHJL
	xy5VXRU8GVC0WaJWo6klGfkBPstcvviXgFRBuqBEX/fM/QIZyteBBFb7FhGZo0/Q9RONEoFhXRQ
	5oxkpqOCIvcm/rOBG2P669VYgr7lvGDAAuRn4o2aoa8bskxkx276sXwPN8C+OitQg+iAGhS4G
X-Received: by 2002:ad4:5aed:0:b0:91e:7939:dda5 with SMTP id
 6a1803df08f44-91ef04aae41mr26184836d6.23.1794302714950; Tue, 10 Nov 2026
 01:25:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-acpi-mmc-v1-1-00934babd69e@thegoodpenguin.co.uk> <2ba59618-e537-4593-a840-744b2f26eb4b@intel.com>
In-Reply-To: <2ba59618-e537-4593-a840-744b2f26eb4b@intel.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 10 Nov 2026 09:25:04 +0000
X-Gm-Features: AclHuK_6-XdyXM_BOekPeBuf7gmeMV5bzRDqK9Cg_lReAyOew94cN51o5FgzEf0
Message-ID: <CAA6zWZL1bSYNkOsRpANDwHSAK+Cp8GvbXnNHiP9fecA3ZP+Ctg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci: Use named initializers for acpi_device_id
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Hu Ziji <huziji@marvell.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_012517_076093_DB1D3418 
X-CRM114-Status: GOOD (  13.37  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Why is there a different explanation above the "---" than below "---" ?
 b4 will put the cover letter in the dropped section of a single patch
series, for more information please see [1]. There is no requirement
for them to be equal. The answer to your question is in the cover
letter itself: first series is a refactor pass to allow for the future
intended change in the acpi_device_id struct to go ahead without
triggering build errors. Describing future events in a git message
makes no sense to me.

> > Unify the list terminator to have a single space between the brackets and
> > no trailing comma.
>
> Why?
This seems to be explained in the paragraph above in the commit
message? I can repeat myself if it's not obvious.

[1] https://b4.docs.kernel.org/en/latest/contributor/prep.html#what-if-the-series-only-has-a-single-patch

