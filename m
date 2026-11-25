Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94CA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FSJEYyHp;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QfeCtZkY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2IwkkNKIQTD9yOnGbltN35CLszZW3KxO3EpOnxWd/W4=; b=FSJEYyHpUqz8cn
	/f8J5LJoANlp6AOh6VByv1lNHB7TXZZblakPuEMLE7FMbAj1euPWFdaZV2MCfidAi+S69v9yDfjwi
	BGE0gh1mKvDS9HqbnEdc31hASB5NHoX7RgxHMeUILSShe6tHkalAVsLj1Hvc2Zn19Zp9sq4Xu1VSC
	wfI5PGLkPaZcTn/u6aqjRJMexEdAb4c9w6yqrMd/6jyUqqmSNOXl2oMRl8R36tVwCZ6ip4gGu3H4B
	F2DBhOuF1xD9k9P7Yn27Pq2T7htcMbkh31v4KuPzY+JBGv9KPSeNjBwLnf3uneVVktJwaxtBAt6Uk
	1Dn3/XG9DxRTX0/Taz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAaT-00000009Vox-1ARE;
	Wed, 25 Nov 2026 10:50:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAaO-00000009VoS-3tDV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:50:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 801BC339;
	Wed, 25 Nov 2026 02:50:40 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D24E53F86C;
	Wed, 25 Nov 2026 02:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795603843; bh=4Dd7GcWl1oQeTlqKg3l9Osi7kX8i/g60nB4/6cxgqLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QfeCtZkY6BAfdkyhMRtbsyiIoHuRTlJNf+Tp7a8RsIcNkMe/AL9Dab5LvWrtPE+mG
	 +hPH/DjtTjX2GKt2MrXSGjXRhT9lOoriHAlUjaHFDyA7KECtyJkM6HE2rz5zbdH+mo
	 1whno53iryrNavf6FtKavej5t3oY7ZVwMiqDl2xo=
Message-ID: <e6eb22d5-fcf8-4b34-a5d9-a68bf8bfa674@arm.com>
Date: Wed, 25 Nov 2026 10:50:40 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: v7m: clear CONTROL.FPCA before the boot SVC
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linusw@kernel.org, arnd@arndb.de, envzhu@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261125025852.1160075-1-brad@sim.vu>
 <20261125025852.1160075-2-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025852.1160075-2-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_025049_039876_B9CC5780 
X-CRM114-Status: UNSURE (   9.07  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 02:58, Brad Hawthorne wrote:
> __v7m_setup writes CONTROL only after the SVC it uses to enter Handler
> mode. If the boot loader ran FP code, CONTROL.FPCA can still be set,
> so the SVC stacks an extended frame, and its EXC_RETURN has FType
> clear. Since commit 72cd4064fcca ("ARM: 8830/1: NOMMU: Toggle only
> bits in EXC_RETURN we are really care of"), that EXC_RETURN is saved in
> exc_ret, which every return to user space uses, so each return expects
> an extended frame that ret_to_user never builds. init then starts with
> a corrupted stack.
> 
> Write CONTROL to its reset value, 0, before the SVC. That clears FPCA,
> and also selects the main stack, which the code after the SVC reads.
> 

Cannot boot loader do that before passing control to Linux?

Cheers
Vladimir

