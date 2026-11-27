Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E80606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 19:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rgQeqlqi;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SW+yelAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=; b=rgQeqlqiMQ+ruWQd2nTCwBtR/V
	agxgzqA7cXkJSzRAzite1k8QVw7yaHnft9vWL91UuDzkplosyfcENlONWuRLLbD6mpbqqKDyxYNQV
	AGmN/aYRU+hyg/Z0lUCrLv9A5H1u+lmX8pIirfn3B62Z7jcM/a+CwBJKYTDLPRxNQJaeMQIXLFM8p
	5fjT9zPgV7IigLMPPoIvfi1EjrG3zjmTbl2QcoP93agg8cSKckDc9GV8NvY15gBRYeMqt/6QLfSrH
	XfYMygILtRaSAYxQ64Ky70SQ/9vYs3kH85II/TU9BeaMEly5nRSB17qGER1w7Jvlz5m9JRumhWAuC
	DOfHZXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1Sm-0000000HX77-0jSI;
	Fri, 27 Nov 2026 19:18:28 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1Sj-0000000HX6b-1GlN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 19:18:26 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-55dc111ae86so17939951cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795807104; x=1796411904; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
        b=SW+yelAEPaKmRbB+/NgzKVHlKE/Wle/cDq5p6essGCcniFFA030WqVQ1URrkNxnADn
         mHzah7pak1EdwS1nuv1DYI7bHF0TuUpK5/sYx7b6AU7umLBkzbivlMkV6DDzMyujC9pH
         8c5aesltSOexk5OjexRAB8alouy1vIgC++RLZ3G9qbEhIDqboPwT2vY9WjRiMS2aEZMa
         2VJI+EDXBFjcJMcBATi81CvGmRO3a5hwlHB8zQ61tqobvc3JJe8K2opOXLmRBYjK2crO
         1Tb5RNmroAmIHkcpcaksI0ZE4uKwadlOQjvFP22OJmu3rb7y4NwyEznC09YYyKTmZCq3
         EkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807104; x=1796411904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
        b=AMh5p3Vi5g6S5FDYa+OWWWOCiQdPpYBes76vRhbvVsdffOWMUeYaD4ekOv0ZV/jjxN
         RnFWPKgzTTPnntVLmzet3Hr7YWeI70aHJ6x8fPQWWEUU5wrAdMZa6bSSU9C+4hNMUxi0
         yqGUT22OeF5n2ZwqXfPQ5bZDkjcz/uK32OBNq0PEK2leiFeutw7k9iLrbPgJMaIgyNzg
         45P3C8qBDKYRLcXPgt4eSIhm8wrhQ3CHFd0E0Pm8R1ap1gFCROH9s6se4hrPAlBRjaEJ
         ltQCtGn1sQp+pQyTg4xx952fjLyXt08uvr05qA+d3EF3wLN9zFaP0UC3CfLj108GiT8X
         +01g==
X-Gm-Message-State: APuU4Z+4Vce/x/St/dde+yomA2xxf5Wzcow/03nqzyIIjJORvoobn/kS
	ULtTGy5YZV1hCmm6eKQMFd7Nk/jYfoKLqs97Gsxb3KQobc4kv7+R8W4S2IuRbWZutQ0=
X-Gm-Gg: AZFdTZeSGeIzIPW4ZwzLdcqNVEZ2KOS9foVVwKka8cgtNZexL/ue1cXQw+A3dMRUaYN
	8o54HBRT9IOiuXyc1qfCZ8GqXEdtlTwW0OwiII2gSsc1agGhJxCqd7F2Xv643Ut17SDKDERbtV7
	l+HWKDMBzWMySyHHXdzKdAHNd4HU5F1IwPtZj3vBaSNFSIL5u5kF8XP6g93mf6keXBeQ5q8CQTL
	s9yeqf46nKQ4VzZPi67Ih3yr83Vjmv4CvZTpvGjozJJhWwXjkYzG6cmvY2wQ6IqHlhi4xWrcLlL
	lEKUVFPMjNnl53+r//2RfJtwjqSVVL2bLl0E5gxu6EmbCVdbaeSO2W0G5QBsKR59yVPBj35WG/u
	fj5OInQJm9ltMKRYaJLegQMAslOecooCApVSWvOtJTep+0vb13j3gkpeC+VHW5Y28S/iC21QfAj
	UNPHwi+aOgw3yJGFBcrE/3FyNu6G3hYECxuDYddrbdM1Pk1Dp140gW/EW1hh7Khb/eBnXcZjwc9
	+zn6hij/faSHiYnDM1cWhabtFGa1nouV5XhOUDudmWS5seFfagoENjBB1SY1gOm1Q3juyaLiDDa
	HbovZw==
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4395559985a.49.1795807103939;
        Fri, 27 Nov 2026 11:18:23 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm1867466985a.38.2026.11.27.11.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:18:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX1Sg-00000007nGK-3YSV;
	Fri, 27 Nov 2026 15:18:22 -0400
Date: Fri, 27 Nov 2026 15:18:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 7/8] attestation: providers: introduce CCA Guest
 attestation provider
Message-ID: <20261127191822.GA1856591@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnK2c3kMq8p2a_7@e129823.arm.com>
 <20261127183550.GV246011@ziepe.ca>
 <awnV5S703Rgf5sh5@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awnV5S703Rgf5sh5@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_111825_356152_55702202 
X-CRM114-Status: GOOD (  24.55  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 07:11:33PM +0000, Yeoreum Yun wrote:
> I think the problem is the *max-token-size* could be changed.
> once the LFA updates the Realm definitely the contents of hash of
> firmware binary can be changed. this means the token's content could be
> change including the *max-token-size*.

I think that is broken, there is no good way to make that work in a
sane manner.

LFA must stay under the hard wired max-token-size limit, not try to
change it while a realm is running. Take this to your spec team.

> For this, the RSI host call interface has the way to get LFA eventlog.
> IOW, after LFA, there will be LFA log is genreated and then for the
> time of re-attestation, it should deliver the LFA logs together.

The detached event log is even more reason the token should not ever
be changed by a LFA.

> > I saw in your FIRME series a solution to this problem, I think that
> > would be good to get out on its own and apply it first to RSI as
> > well. We will have the core RSI stuff, the realm attestation and TSM
> > driver at a minimum..
> 
> Hm,, Does this mean do we need to create two device one for TSM and
> one for attestation even the functionality same?

They won't have the same functionality. It will be the same as you had
with FIRME where there is a driver doing CPU attestation and another
one (the TSM driver actually) doing link IDE.

Jason

