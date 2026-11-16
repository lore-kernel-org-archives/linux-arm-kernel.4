Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95046606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 04:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OQ7XO53e;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=r5p35Vat
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Content-Type:
	MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yb0ouDgf9S/OdWev3vcVfqdIAaKZrYAoDUUyKNG3AEU=; b=OQ7XO53eyp5knRl8pkvp9QTSej
	lij+rqDdwdQl4GErxCDA2xFM0gJp7GwpB80UWqkvoInvzKa8aTE0pjnDjIcWpzmyZwjZ7KPpLVoiQ
	/S43d7sO3pg1YJBejPSiJig/1M1QXw/jbMj6x5OHFtIoOwMSGPLNuJGXR+4V6hdSOtlWKSoKfccX2
	w2yracuOhP5H0zDZBwQN7CskcvB3/6rh58DU/7VnyTg1krFIgJJj0rs67V1XE5cYiaiEQXR0iClfB
	H7a1jXO/w1jSi+7Pv73B7TiTQXWfMY2MCREuDc170qtxoNzrBluth93cE3wr31fTfDehTpf5S3VoN
	rfC2vRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSoQQ-000000018PG-07Wb;
	Mon, 16 Nov 2026 04:34:38 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSoQF-000000018In-3hyH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 04:34:28 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1b24f4b15c4so926650c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 20:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794803667; x=1795408467; darn=lists.infradead.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yb0ouDgf9S/OdWev3vcVfqdIAaKZrYAoDUUyKNG3AEU=;
        b=r5p35Vat5n+//hZrG6aP3ksKFGfLA1oMipACe45Dqu/AVh9jChRLNZY9GdNPahXMmp
         nEFdtd9sVElZ995pZJJehMr+Xugnw621dXZPsBuMMj2ukzOKEYUGjPlMaL7mDOwp2wR/
         tapb03N9tfwR6j1xonIb4Hn1IpM0J8YzMMwG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803667; x=1795408467;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yb0ouDgf9S/OdWev3vcVfqdIAaKZrYAoDUUyKNG3AEU=;
        b=YqwaN3r6mqg7gVq0jUBGEwtbDJTcNQ1XajmEg1FLESvpD6RzkIFvKCbthf9gH41GFO
         8UZOTKAUup3bO6Ilb+yyFLLE/qrMIRRAhDihKGsZYk7KIJ6JgMl4OreOQnRdUf2LKNnP
         uRh8QOMu2lbUQoCq3A+FHBdUX1XmTyHDd0yqblV5pfrMZ8HXFtw9Imae/oJp9Iorpnrt
         pB+i7zWkDII8r3WrbQpeMI6vpmwgn0rbzgBCyCwyy1MKKAR+admHAJ7knKMAE5aZLoSe
         iPDDOMv7kjSn22w0ozJP+xJEXyrYubv3ypK73YCN+L2hhnoq/AQ3KCFKHCZzo0INU8OS
         yoLg==
X-Forwarded-Encrypted: i=1; AL+hErGmc8clij7FiX4Z4jgfGeatyW9k5pwsZSsngPul7yo8vBM8UpkSYYR3UsvZIK1oveZxCGRmAOY/ngECBEEpV9GO@lists.infradead.org
X-Gm-Message-State: APuU4Z8jfk9FrF/OmBA1nQsGGv+vjFnYrOpDLFrHlflWXmrfR70eVpzx
	9PWW1gcEw2vSA6Sgwe8pd3sDSlcVyvGcN9vlDzyn5wWCHnBcnOCN0QJk9rca8cCIScM=
X-Gm-Gg: AYBFou25ZIwsueM+VuDgjwMpjyhbtCXPVhJBB7UqP6B95N9aflQPUxvyGUbRpL5v5A6
	EcnVbhXE/7vfZzNS6Zb+Zz2Tf2biY5iJ1C9NlXKLwfSxjVyo+qtakuS1Z7OEeEWj+k22UlO1VxZ
	1Yre3VsMgsoJTyDXUPBU8m+J0ZCQH9qRpq6CBet/dzkIi+es1FoMQ8F7BqKjQ8u0LO2kiQZFlYp
	pG1kTviH6KmuJ90w2yKccvRy1eAYhxNfmEpdyc7f+IL5GL0IjXN7N9LNnwXgsR5nBK9yzvpQM8R
	3ES6E2+a7l+8Xwv/JfnGOsMGCERT6sKUdIhA7cCpfQoZ9XsJolCuYPE9slTkiJMYhofZMnvUH7l
	yYMHY3zEWtHfx3Eq5zDcMEgI8mRW1v289czRDvFLuvEPi7vwtSWIw1GVntEW1Xn5sqP1S7JsGOc
	DpXVbJLghSEGxpph6KjU4YfRNjk1COEZwFu9wKrao+jFKudQWeXEvrSBUDvFvxUZWVymTZ6yh6R
	mEW0L5I/KGZBARS0qli61NqgD4+GEsWbbBW7EAZFHnPDSYxxwv0dSZInzYL4xScfAwPmGxeE2AF
	PGphhmjULhn9KYJZO93Bzk76G1A74rGpSCIx9O4xa4vE5mR9qfUAXf9PVzzaEZLcIpThXRAHlzC
	Bm5WF9KyD9a9GVF/zurTVSD5k5RQEpPRBidDJue4UOgJMFeov4I+lvx+EHK6h7mV4domgxLLNnl
	nv0evVglNpGf2DdIVJWLC2pIvX7d9Z0iCaD4e+epw5woO2j4sIljQkEy7SzO82BvNF
X-Received: by 2002:a05:7022:b0c5:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b4f5f3475fmr11110443c88.10.1794803667022;
        Sun, 15 Nov 2026 20:34:27 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm38362148c88.9.2026.11.15.20.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:34:26 -0800 (PST)
Date: Sun, 15 Nov 2026 20:34:21 -0800
From: Chris Down <chris@chrisdown.name>
To: tarunsahu@google.com
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, maz@kernel.org,
	will@kernel.org, David Matlack <dmatlack@google.com>,
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com,
	loganodell@google.com, arnd@arndb.de, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, Bjorn Helgaas <bhelgaas@google.com>,
	oupton@kernel.org, alex@shazbot.org, gle.com@google.com, pbonzini@redhat.com,
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com,
	joro@8bytes.org, kvmarm@lists.linux.dev, linux-pci@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, skhawaja@google.com, sagis@google.com,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/19] kho: Add feature header for fine-grained ABI
	compatibility
In-Reply-To: <9huz5wy4tufo.fsf@tarunix.c.googlers.com>
References: <20261110050202.529473-1-tarunsahu@google.com>
	<20261110050202.529473-6-tarunsahu@google.com>
	<DMRMLZSZ0LAZ.D4P70QWX0IHB@soleen.com>
	<9huz5wy4tufo.fsf@tarunix.c.googlers.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261115203421.38c206b35f5b12e6@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_203427_923782_FB32014A 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.2 (+)
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

Hi Tarun,

tarunsahu@google.com writes:
>Techinically this is just for readability.
>
>WDYT?

It doesn't help readability in the generated docs, though. kernel-doc
splits the parameter list on the comma inside the macro, so
kho_preserve_vmalloc() comes out as

     int kho_preserve_vmalloc (void *ptr, DECLARE_KHO_SER_HDR(kho_vmalloc# *fhdr))

and the struct memfd_luo_ser and struct luo_session_ser definitions in the
ABI docs end up with a member like

     DECLARE_KHO_SER_HDR(kho_vmalloc folios_fhdr;

I'd go with Pasha's suggestion and use struct kho_ser_hdr directly. The
pointer can then say which payload follows it with a comment.

Chris

