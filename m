Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFF6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lm7WwMKS;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ofIy15OT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EymnD5MBbabJpXRL0s2OgMISx5E+3aU+ua2xTgbJ1xM=; b=lm7WwMKSqp+7K2HxVfh6OltROK
	3VJD6BdTSPWBbS6tKzpqNPH0+05Ex4WkXwwe/gyz7EhzNbTrkg3w0AxJStK2cEyTevzQbMnYcfuJu
	/P4r5B5nCVVd1xWlk0DRwXREni7BBCEgwqAB/ooilQAOENtNImDvceLHZz3OuCPODKWlDeJ/LO3YM
	nz5fl8J/j8a3w9Y/oXCcdDWcZbiu8IisXxflkgb0N+wUoC4FUJWE4i8hdqAx+N2of2TaFe3pbQCDL
	KNQRqg+GucrdEcRupPUhf1956VmcVHvcgQpV3Cp6peGy/K5CRKOjJ/jfr01Sd1KdWlknZHJ5aCPhY
	TEFLtmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVomh-00000006Msk-3y8a;
	Tue, 24 Nov 2026 11:34:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVomf-00000006Ms3-2ITp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:34:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A527A339;
	Tue, 24 Nov 2026 03:33:57 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D58553F86F;
	Tue, 24 Nov 2026 03:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795520040; bh=pF3xzyoFSRsAIr/NJIPBiWdUfn2WC5qYaw3V0lFMPyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofIy15OTKq1qh4cAumr3LmWK32Loo4zoq6ckUvHuNl4zPHsJJzUGR0L/iMU2QZXlq
	 3oy8DUbbvCjygFu6DxG4vN6b1iEDiYT4phayAkJgY9tu30rRRd/kqSNRA10xqwjtEE
	 H/sQsxIKA9V1HB2e6pOOZoyhIGRf7aMO2MJVvLNY=
Date: Tue, 24 Nov 2026 11:33:55 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	virtualization@lists.linux.dev, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: paravirt: Mark steal_acc as __initdata
Message-ID: <awV2I4GpgpMvIke-@arm.com>
References: <20261112193513.2655-2-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112193513.2655-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_033401_626371_40A2592D 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 08:35:14PM +0100, Thorsten Blum wrote:
> steal_acc is only written by parse_no_stealacc() and read by
> pv_time_init(), both of which are __init functions.
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

