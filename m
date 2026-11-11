Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA09606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LvlDlunz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CPe6sEoD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mBSo8+i91CrACZrxGkLXrZpH+5L8K8Z5H9NJzXzfrR4=; b=LvlDlunzlq0Qcd
	66J1TtiDpU/trNXQKtfRORe/vkBXcxloz8NhxGxQqngidaMnpi0QqeONY3EkyeLWPI7DfgOvFlLsA
	tAd3u+TpoZkg53yDYM9yXnWyWCrYLx67E4jAP2mCGSiLnuegTA2+BP2Kom2uMLQJ8Cu8268ujXFHv
	o48ufW5U0tf/7ujHl79SJ5iE+Xt+/csV+egctuqYl82AgdwjhKLTsCa5G3s/itCiEYRBBMFYZq1sI
	orDc5FwydTGvC2fSPufPwJN3SSNIPcScoKxNFJOCwNbcRdAkEBYJMnkpb9gvSuQLCKJzawB3Sb47z
	5na6P9i62yp2t1VLU+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRA9c-000000074hx-1Gmz;
	Wed, 11 Nov 2026 15:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRA9a-000000074hS-05I6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 15:22:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1AC61576;
	Wed, 11 Nov 2026 07:22:21 -0800 (PST)
Received: from [10.43.20.72] (e126510-lin.lund.arm.com [10.43.20.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2A903F632;
	Wed, 11 Nov 2026 07:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794410544; bh=mBSo8+i91CrACZrxGkLXrZpH+5L8K8Z5H9NJzXzfrR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CPe6sEoDXEq0CUSjZ6jny/Hfzg7F0nl2TvWdHaTVM/Z8om2nXFrbUEHiNinOsLi3G
	 b+zM4dJw+QxdRaUrtNxakmzC6AiBkhYtoNt/T+Y94M/CGZNoMTkg+so51tIkMogts4
	 Zp7PhvG4gHcOkBuMpB9jhCJKm3Tc9Y9pOp0sQA68=
Message-ID: <0a48af69-d0a9-410e-9d10-389eed0827c9@arm.com>
Date: Wed, 11 Nov 2026 16:22:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v10 06/22] arm64: Disable EL2 trapping of POR_EL1
To: Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Ard Biesheuvel <ardb+git@google.com>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org,
 Ira Weiny <iweiny@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-6-aa6c4d9603bc@arm.com>
 <3500936b-4177-4ba0-a9df-7eb9d9d75b0a@sirena.org.uk>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <3500936b-4177-4ba0-a9df-7eb9d9d75b0a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_072226_105770_5FD6841D 
X-CRM114-Status: GOOD (  10.21  )
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

On 10/11/2026 16:29, Mark Brown wrote:
> On Mon, Nov 09, 2026 at 03:58:31PM +0000, Kevin Brodsky wrote:
>
>> Make sure EL2 doesn't trap kernel accesses to POR_EL1 by setting the
>> nPOR_EL1 bit in HFGRT{R,W}_EL2.
> This wants a matching update in booting.rst as well for when the kernel
> is booted at EL1.

Good catch, in fact POE requirements are completely missing from
booting.rst. Will post a separate patch for what we already need
upstream (i.e. POE at EL0), and then expand the section in this patch.

- Kevin

