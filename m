Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E35606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJE0cURK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGTg2ZDf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZmNNrkYoDlObKGEWXN/NM8TQ0vBE+3eTJ9t0fVYsCNk=; b=uJE0cURKYiY4AuHl7j1pxOtzI1
	BgiujN43zQTjiRLdsvpMeRTZKNPtXAmVP3zbEIMDdZ+Wj4yUGYGNewVkLL/ytKerLfgPB6/FEriEg
	rCaSgUqPEay+iDXNiib0uH6qQh4cWIjG+Mb4aZoPbaikwjQA6W1a3LO502Kso0fjTVnSzECnhcRr3
	Sl7De33aSkASBgbYts+uB7/VMxmA+PCorTGK4rNVeuEkvnx2OwAif7+ZjjAXgCU1SaUgGDoZWRZyL
	vQpj9TN8094j8BA52BlBdjGa2kLLgYP1hgjAcn3V/dSZ5/fjANJiSXwKq91Mp4WGwjK6x0kcfRZsr
	FcD9fI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRoL-00000009Tpq-33Fi;
	Thu, 12 Nov 2026 10:13:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRoK-00000009Tpd-0QHG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:13:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0E86408CC;
	Thu, 12 Nov 2026 10:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24AA1F00A05;
	Thu, 12 Nov 2026 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478418;
	bh=ZmNNrkYoDlObKGEWXN/NM8TQ0vBE+3eTJ9t0fVYsCNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YGTg2ZDf3iYzt2uYHKEqZhYIdqLwemfsaiXCvrbzHPTvXrChKwnX4kZuFOLJX3VRu
	 2w5jyR403QHNohpvEprbr9c0+06LLW7cCLHgl5qf/wSj9AnZ1aQ60yMGyh+DopNZ1o
	 T0oERaGZ7cobW+IZ2f5Ob1uc+2IPxbI1nvK50I94uiK2kSYd1tT2FLrQzcXQvFcJID
	 b5lHiZLpE2BnhbCnvcnVDy9F2ysWmSOu/IZdirBBZpLG+vpPVVfpogoYfeeU8twVXZ
	 C0AWUYxpM9IBngJum+WCKEhlNBl9WtSiNV+T4b4BJN1LxGJdKeAIQQVASqTylhcD8j
	 rm7EFKnqbSYGw==
Date: Thu, 12 Nov 2026 10:13:34 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-kernel@vger.kernel.org, dario.binacchi@amarulasolutions.com,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] firmware: psci: handle unsupported
 SET_SUSPEND_MODE in PC mode
Message-ID: <20261112-attentive-gregarious-beagle-9c1fbd@sudeepholla>
References: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
 <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
 <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>
 <a2432129-613b-4f17-813d-82ac8af9b6d6@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2432129-613b-4f17-813d-82ac8af9b6d6@foss.st.com>
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

On Thu, Nov 12, 2026 at 10:40:48AM +0100, Patrick DELAUNAY wrote:
> Hi,
> 
> To complete my previous answer,
> In  last PSCI specification v1.3, we found this description:
> "
> 5.21 PSCI_SET_SUSPEND_MODE
> 5.21.3 Caller responsibilities
> The caller must be able to cope with the following error return codes:
> • NOT_SUPPORTED, in which case the calling OS can assume the platform will
> work in platform-coordinated mode. In this case, the PSCI_FEATURES feature
> flag 0 for CPU_SUSPEND is also 0.
> "
> 

Yes, I can't disagree with that, but ...(see below)

> My patch only implements this behavior:
> the PSCI stack in Linux assumes PC mode when SET_SUSPEND_MODE is not
> supported.
> 

To reiterate my earlier point: if PSCI_FEATURES reports that a function is
unsupported, we shouldn't invoke that FID in the first place. Dealing with an
unexpected NOT_SUPPORTED return from an advertised FID is a separate case, and
we must keep that handling unconditional as it currently stands.

-- 
Regards,
Sudeep

