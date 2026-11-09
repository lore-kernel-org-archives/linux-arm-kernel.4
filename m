Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dMr4hJMM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ozg8aZ+6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=asv+L+6XrSQhvTA+x8KlHG7bpla/glF8wUGDppGecfM=; b=dMr4hJMM9xKx44
	41DZqpqNzug9pRn+5EjiD67Qpog/qTN94ITCqoCagAYz/m5fwUKypfa9WLegk5s/iOD6HMIc2ehTS
	vUcbMUFZcdwLi3MglN691Xvb4hypn6kF6wWzxxJge1wCueY0aSe1gVLVlivPkZwlw42u3u6lYUc/O
	ns0K7d5xQtTPxJboGN4eb8FRqWX2BGr03csurycVi6H1TgCRQDtkOfJrL4SaMgEIpFEdz/K6tXjSj
	wALnlAX3GwzAnfUWAHALRx7sowz79gKt1iYECMbNk/A/FKbiVlPdiGt9B6UCIiFMt+6ObOvldpXCa
	5KFdK79ehzXZdrTx2N4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLMp-00000000AS6-3jow;
	Mon, 09 Nov 2026 09:08:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLMo-00000000ARc-063z;
	Mon, 09 Nov 2026 09:08:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 891F114BF;
	Mon,  9 Nov 2026 01:08:35 -0800 (PST)
Received: from [10.57.12.22] (unknown [10.57.12.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABB8E3F85F;
	Mon,  9 Nov 2026 01:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215318; bh=b/Z8FOQeGGjUmR5j+LUi8n9Jv3kX2zKWVa4aDbKzjXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ozg8aZ+6ju7WL3UUHR16QwAhksplV/ASDDZW3dQr9NmR9+OrjSnwnB/YOwK6Sn6eT
	 +kIEQtT4khd5vClwnlxABv+rMZ8rWsoTdj93yBRbD6f4dn+ZaVIkqT/uh+26cpQaZ/
	 O1NXsHR5Qj7I7BU7NBsc33Kqv2YFefS6QtncQW+8=
Message-ID: <bcb0bfcb-e359-4710-aa6f-8de032327d03@arm.com>
Date: Mon, 9 Nov 2026 09:09:09 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] powercap: dtpm: Use generic powercap hierarchy
 helpers
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, rafael@kernel.org,
 Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kselftest@vger.kernel.org
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <bded992091c92baa7246b939f266297f99c8942b.1793666444.git.daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <bded992091c92baa7246b939f266297f99c8942b.1793666444.git.daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_010842_223963_6BFE99C5 
X-CRM114-Status: GOOD (  18.82  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/26 04:48, Daniel Lezcano wrote:
> DTPM implements its own hierarchy creation and destruction logic while
> the powercap core now provides generic helpers for this purpose.
> 
> Convert DTPM to use the generic powercap hierarchy infrastructure.
> Duplicate the platform hierarchy before creating it, and use
> powercap_hierarchy_create() and powercap_hierarchy_destroy() to manage
> the DTPM zones.
> 
> Add DTPM callbacks to create and destroy the zones associated with each
> powercap hierarchy node. Adapt the CPU and devfreq backends to return
> the created DTPM instance and use the node name provided by the
> hierarchy.
> 
> Convert the Rockchip RK3399 description to struct powercap_hierarchy
> and keep the device tree path as DTPM-specific node data.
> 
> This removes the DTPM-specific hierarchy traversal and destruction code
> and leaves the hierarchy management to the powercap core.
> 
> Preserve best-effort creation: an unavailable backend returns NULL to
> skip its branch, and setup failures are warned about and skipped rather
> than rolling back independent zones. Invalid node descriptors remain
> fatal. Reject a DT node with a NULL path before calling
> of_find_node_by_path(), treating it as an invalid descriptor rather
> than an unavailable backend.
> 
> When the representative CPU is offline, find an active policy through an
> online sibling whose related_cpus mask contains it. Hold the CPU hotplug
> read lock during selection and setup, and initialize the zone through the
> policy's active CPU while keeping the hierarchy-provided name. An entirely
> offline policy still has no active CPU to initialize through.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
> Changes in v5 (since v4):
> - Reject a NULL DT node path with -EINVAL before invoking
>    dtpm_setup_dt(), as suggested by Lukasz Luba.
> - Document that a missing path is an invalid hierarchy descriptor.
> 
> Changes in v4 (since v3):
> - Rebase on v7.3; no code or commit-description changes.
> 
> Changes in v3 (since v2):
> - Rebase on v7.3-rc7.
> - Preserve best-effort branch creation using the generic NULL result.
> - Find an online policy sibling for offline CPU representatives and
>    protect policy selection and setup against CPU hotplug.
> - Keep generic API behavior and documentation in patch 1.
> - Fix __initdata placement; match-table indentation is handled in patch 3.
> - Name setup callback arguments and remove whitespace-only lines.
> - Update the description.
> 
>   drivers/powercap/dtpm.c         | 180 +++++++++++++++-----------------
>   drivers/powercap/dtpm_cpu.c     |  62 ++++++++---
>   drivers/powercap/dtpm_devfreq.c |  22 ++--
>   drivers/soc/rockchip/dtpm.c     |  67 +++++++++---
>   include/linux/dtpm.h            |   6 +-
>   5 files changed, 198 insertions(+), 139 deletions(-)
> 

Thank you Daniel for addressing that, LGTM

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

