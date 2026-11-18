Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rCROrwI8;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=JGKNcP5g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RbuRo9+4LwWGk450hUbm5Deje65UJPyjigHbG1aZxJM=; b=rCROrwI8+oVCUIt71kVZl1fn3x
	c9nWe09Os3MdAqGO2LZxW2jkBhdM3HhI7Dk6DFJptwxSdOugYM9NR2tgbtilVzsNKZnEkcz6/OuvC
	Y2F8pw1weaqYx+TDiBYQS1rbVMXCK+YCy5a4dOsLBSPAcmgJhZqMPOu0VQdmZJ2Tm8+U2r8z7E4Hz
	WGm/0vMcOLuaXSrT/nh+iuSJAcxeolgJkur44QvV9mdjzeEjhds2qvyTzB5b3ITV22/OXIRk9BWsQ
	nwYrhkJkfAEayjgJVyDr/5svFJRkGtRikyd2WpodOIm/AgxIUMsBXQK8IjTBZhsIwOJDPSD3esSOC
	xx5kLIow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThbY-00000009IVx-1gq9;
	Wed, 18 Nov 2026 15:29:48 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThbW-00000009IVV-0oI9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:29:47 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c5118deebcfso105146866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795015784; x=1795620584; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbuRo9+4LwWGk450hUbm5Deje65UJPyjigHbG1aZxJM=;
        b=JGKNcP5g9YEQvq+Y71vyp2l6jDaiK93HrGTMVcd3QyNmRD1zJbMwxM43Nb3swy87aU
         kz6DJDkU5knst5H+o9iMZyH0BJwhOPSzf3Z1SAibbYZFdfcj0B9DpPnhWjdtK1lIUgRi
         m9J0Li7zzGFnNQXcBCvMIOXM0Ks6ZT3g34HP14BuVIte5bgsr40VWGhG51o1eRVUKWp4
         f0J+ARo4o0F+c9tP2Y29qXoIgbu047Pcjvv7PpIvFfa51UyqS57M93P0KipGy20eaO1Y
         y1gpp44KJMdM25u/bxQQQHvr0DtvEJICIY+ywVKuBlmKEw3sfkuy4VLjzkVlJaVo+hFW
         A7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015784; x=1795620584;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbuRo9+4LwWGk450hUbm5Deje65UJPyjigHbG1aZxJM=;
        b=UOgm7TQMPPtaWg2bmq/w6v0WTqXLR6RMujHebagn8jQsH23bhYVDmCb3pQSmvji8MS
         NpBQfXfGOVnihLsSYgs43hIbwj4kGGJazPuESHajbKGRse3Q5eYRlj8OBh/H12TehW9w
         muaT6r3ZJyE3N39zPp29IQLCoAj9qg+ddsh9a8B7h/yCkx4MaKDdlLb0A/zonFVN3u7u
         WqGVqTLvKTkDL81u6tQM+CtpRCmQBSf7hQ2mzuaFjbOvjPWRPc9U7MCOU51uJZLo6Lvz
         KkG2zN5ysAwrB3CJkiN4kN08+YnNMV2S6Ji2BEuWR4xWgGYkT/Jsw2hyg+nXWq8Lp3Te
         0qbw==
X-Forwarded-Encrypted: i=1; AL+hErGPObYudaXJ5Jv7JQG5kivo3XtGMCJOV2S3atLQ2TKQe5LKwjOoUYVhPhb2w19OumCpIm/gaSKw7ZhhXM8A41oC@lists.infradead.org
X-Gm-Message-State: APuU4Z8DCB5dp9H5UJ7GRajjMoU8Z9bz4sSsCqttih5eJ6EDbcpke4I8
	sp4h76MW7s6siit7bzcU5dYiMv9Hh8iGlvDuyjxQooawfoStG11tTBPMX3hllgOQ/uM=
X-Gm-Gg: AYBFou112S/QI9kEzPL+S8s6MZmVOld2vFtaL9kUYXwcQP26VcCms6fI2ctzHEKnkfY
	o7qyhccC6bV83zJxiq5w3Aec+Mgoy2+O5MSiol4zai0WITECTlsrn5IdjsWBn1Gjfk+jiE4Xj7o
	LkKAzwYho42KLrdpzKlOwNHSZMJzxAMD86PhqyVAqMmAKQeY6rmL2ooRc7znHR26w7YHtRmGKL5
	rCT0un/4O4GZvvy27aJP1aTRzilP46QWYCcfGd523/Na0FxC0MWrIH+9Ln4uUMxwQNcknQbPIEm
	eCciUqwE+/E1nX+ZiuVZ7D2TAdh48A+lWzdLKvj+1aUXJj/FHVJAzM3EeZo5DbbcoxPlgvdit+V
	9iW02ai9zzkh0nH/0cNPTR7Xd4JZbNFHaTI+GDcIosmhu1glRvpthmOYrHfI/eeM+QiYd8QFAjB
	bMLrcg24YHRWw70YVxr36PlpARSn3zWTBJb1ZJXqmFcJGlWXY6F3ZkGAtYxx0ZxTyxN+JDpQNYZ
	GP4JMZcWboTezJ/N06b3YRAUcj2iLtiOcMygOe0CPcSMODz7IPjSaw+VPphiB++MC5p9Pi+9VIa
	IE+XX11bWzhjcMtkrPw=
X-Received: by 2002:a17:907:94d3:b0:c4d:31ad:f641 with SMTP id a640c23a62f3a-c510debf622mr278697866b.3.1795015783648;
        Wed, 18 Nov 2026 07:29:43 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc1a2sm15878866b.5.2026.11.18.07.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:29:43 -0800 (PST)
Date: Wed, 18 Nov 2026 18:29:39 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH 0/3] KVM: arm64: nv: trap forwarding bugs
Message-ID: <cover.1795014776.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_072946_254394_39A6B8A9 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This was detected as part of our Formal Analysis work at Pereq.

Regular KVM and nested virt traps have been getting out of sync.  Fix a
couple bugs and add a boot time check to prevent future bugs.

Dan Carpenter (3):
  KVM: arm64: nv: Forward PIR_EL2, PIRE0_EL2 and POR_EL2 traps
  KVM: arm64: nv: Forward CNTP_TVAL_EL02 and CNTV_TVAL_EL02 traps
  KVM: arm64: nv: Report EL2 registers with no trap forwarding

 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/emulate-nested.c   | 10 +++++++++-
 arch/arm64/kvm/sys_regs.c         | 23 +++++++++++++++++++++--
 3 files changed, 31 insertions(+), 4 deletions(-)

-- 
2.53.0


