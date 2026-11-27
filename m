Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DC606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bztd1QJK;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kdGNj+nO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+9Dw/wen6g6fWY32jCYKXg0uC2F+6Oaru/Dn4CTkyZM=; b=Bztd1QJK/ObEnM8rFjRJS+uCcP
	HR6iARCzfkYCtS9v1SD6U5x0pTPK6LNEqL4v/FAPKb16Uj3meH9UpzgK96JrVS/1DvDWe3cZw9qMN
	WT5BTLQHa7zRPb7th86TzaNffUi+T1qSiCswil/EFJjU8rym2Fe2/hQKLqMpLiOr5pc/Hru2qMwps
	tcuuw6pqjbZZOBXSkDPVjdU2eaPo9WQ7Be+Nq5GuAUX5bJ6o0D5f66DhiaeTukg5EkvDBMhopfI7s
	9LYZJya0s3Oi61AUHonWxSdMdupooew9BxvbBF/cJBau21+MokGdx4MMzvw1QXjGkPluLhII9EUDK
	2+mEQI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0oX-0000000HQwj-1SQj;
	Fri, 27 Nov 2026 18:36:54 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0oU-0000000HQvZ-3Bae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:36:52 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-91c1f548f87so109316816d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 10:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795804609; x=1796409409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9Dw/wen6g6fWY32jCYKXg0uC2F+6Oaru/Dn4CTkyZM=;
        b=kdGNj+nO++tVcZd2IgNN4+CfeRenpHhO1wE2ms7MkPei8tgnyruuVOrie2qMgpKXbF
         kQNoJQezq3z4zrUvnndPNw/tRJCtHlOFR/GYrWDQsdSwj/w+XIgnvm/SgtnfZqS/+4iK
         uOqgs/BS0dUI+h62Din75h7zzIP8ZRTDcxNNKKalPPNDqNq6cOvMlwdFQwlLt6cMFPIO
         XyErCbrh9GS6l1eXDhvhbO2UE7UqZAHUnngNlflHPRYrN3lpDBOOxvolJWcVkfJ+JfSP
         WIENHD5AYcx6Vq4BXz1keZ92d1b9ZXXE4rDTP97cEkjVJxJn7GMnCHf4afgl72nUrhxR
         kjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804609; x=1796409409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9Dw/wen6g6fWY32jCYKXg0uC2F+6Oaru/Dn4CTkyZM=;
        b=x9ErH0f0XlrpJJPcXe+Y9gRMm0yRLFebL9HYqt5vY/Ca70eUCMiJ4AqiMRVhfq2zTl
         uZOH/lDqijAmzZgukIu7aTMeqhA0alK1bPrLWK5rb0DhN7IK6FBWhYALP3mOgWGq8fOr
         YRbVsltIs5+SJkCxaaK7Xgj+SNqrZyK3fIvw/HEDK6MQLY0umyQZyvFBicCo+NAnP/F5
         YWf+Za8VtVB+0qXlN+m0iyph72tK7bZWkNkWqZTJMTLp2Crc6HZKa+HX4ZqWzrBlPp5s
         vZ+zgSs7N3tfvDt5ZgNNeHsb/nTznlrgAFADxBEP4cnamyNZbdwtKdvsS40ftKS5GvvT
         0xBw==
X-Gm-Message-State: APuU4Z8ibVcG8BPgV0jFGaHoMTE5mtIa8LTeNktiqKFlFBx9+WaXsaRP
	nlk/APkjEP9aGxGygE5OuO7OEOLYuQIYFbSYr6HoEKPBTFADY5Ar/ZajPEEnxadOiuo=
X-Gm-Gg: AZFdTZcQ6oselpAiKMC3hfUVjuI88+zRnHqm0DAbATb9aq9l6/ukMr0e9QO7eaN4i5M
	UYPAO/d74nPmmeVlxxkDPwWHTH+ZlyDN9Z8TELX0AYlRo73fmZAhU7BXdFOAlxreYg/KgwJsYls
	/HZHmA4CrifuSlTsy7nbjMN58ONxlUEnVsRFeBA+h13cygF2HeL9uWJtD41AAfZ2F1UEDbpVT5a
	iYO3WM87JVCT9O8rLvTn9f4xU7i5K5sELbfAw4lX8z3XiLGcn6dadkN/UaWFSIZLR553/u+DHPG
	WiVcejrqmUCzu4PvOydvhZja1DGgxOjI4LoB0LiWCL60BKM/HdFdpayqPWgLNCp1Pf8t2Dz3EbW
	H71d58cAN6zFbbfYizbus5sMtIsQaeRNFDOqUPUv0MJeClmqKBU49X/lw2DeltiOtjKwVOgwS3Q
	BQKOzXxLuVoZJd/2T8J66s/7ohHLDsxYkgNoqYv0XPfHu/ccgFUPfzxYUDA+J0Dw2hqpY8fg93v
	bv0pAFCd0MKNEJKakEtC0ceZNwYL9BjIJBpjcSxf8+mYgEL4liHWz/pcM/FLLvExR0YdbwLpDSE
	GdSVlIc=
X-Received: by 2002:a05:6214:4686:b0:921:1ac1:34e2 with SMTP id 6a1803df08f44-921653a9042mr254285806d6.24.1795804609400;
        Fri, 27 Nov 2026 10:36:49 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm225559716d6.15.2026.11.27.10.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:36:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX0oS-00000007aS6-1aU4;
	Fri, 27 Nov 2026 14:36:48 -0400
Date: Fri, 27 Nov 2026 14:36:48 -0400
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
Message-ID: <20261127183648.GW246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnLgFZIhRZENiE4@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awnLgFZIhRZENiE4@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_103650_805037_763A28A2 
X-CRM114-Status: GOOD (  10.24  )
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

On Fri, Nov 27, 2026 at 06:27:12PM +0000, Yeoreum Yun wrote:
> [...]
> > 
> > > +static enum hash_algo cca_guest_attestation_algorithms[] = {
> > > +	HASH_ALGO_SHA512,
> > > +};
> > 
> > static const
> 
> No. it's a scaling issue since the attestion algorithms could be not
> only SHA512 but also SHA256 and SHA384....

Then don't init it here and do it entirely when you query the RSI to
learn the right value

Jason

