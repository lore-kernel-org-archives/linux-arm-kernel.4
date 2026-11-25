Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lVOhQUkm;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=U9s78iQ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VeaRMJr5MeN6pZeuCdvkhBSCAsTmvP8phUZZr3zTlcE=; b=lVOhQUkmMJrmTN
	5FiDpSvXxOEfb8FPYK62P/pKNLXxIb/gGGUUtZ42QyWV/bwnS9XaD9i5kYn8qdD1BmwsYfk8ubjIJ
	RfY4QS0Jf2/8oqWOC9jEIlWjNBxuqK9z/mRKMMk9bwgj3JusOQqHmlteB7NPHMG/vlf3twm+8XMdQ
	7rXzpdsRlXeufY0dEV0vzNLJhshW/7mGhS5Ia4dhT3Oik2dber8veKezQGedVjIuhmelAOZFm4Zrq
	5e5oZ8C/loMW1oyOaUZaRe/1EHUTmFzU9IrQPqp5wre59zYPoB90C0/joGZbwjOvWoLY2/RMFEp1a
	jgoIRrd2VaoAWCFC3K/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGKB-0000000AeTC-3R6C;
	Wed, 25 Nov 2026 16:58:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGK6-0000000AeSb-28qO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:58:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 072B62F;
	Wed, 25 Nov 2026 08:58:18 -0800 (PST)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214143F632;
	Wed, 25 Nov 2026 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795625900; bh=Szbs47AGBw7DAENnZv9Xsgc+H6POhcnLH+71i5NxoB8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U9s78iQ4n5uVP9leVJ/aLlJnv5O67E7SgX8wHk7l9krSm6na71RnT7vG/K4WebKA/
	 cUdz6A3SDQ/wGcSetyhDMobLFDeJtJPuTeUurN9+hdufIk56Ghfs1isogtR2R6zI8X
	 h16BVxJAFr0x8yRI1VaxGhezjyX0wO2QT8rktMcs=
Message-ID: <9ca5ad64-f884-4741-adbc-a54677fb426f@arm.com>
Date: Wed, 25 Nov 2026 16:58:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Use at least 2 bits per XP coordinate in
 node IDs
To: schouleur@snap.com, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 stable@vger.kernel.org
References: <20261125-arm-cmn-xyidbits-v1-1-6f7bee891859@snap.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261125-arm-cmn-xyidbits-v1-1-6f7bee891859@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_085822_663039_F2CE0D7D 
X-CRM114-Status: GOOD (  25.18  )
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

On 25/11/2026 4:15 pm, Sylvain Chouleur via B4 Relay wrote:
> From: Sylvain Chouleur <schouleur@snap.com>
> 
> The X and Y coordinates in a CMN/CI-700 node ID are encoded in 2 bits
> each for any mesh up to 4x4 (7-bit node IDs), and in 3 bits each for
> larger meshes (9-bit node IDs). The width does not shrink for smaller
> meshes: a 2x2 mesh still uses 2 bits per coordinate.
> 
> arm_cmn_xyidbits() derives the width from the actual mesh dimensions,
> which yields 1 bit for a mesh with both dimensions <= 2. On such a
> mesh arm_cmn_node_to_xp() then decodes every device on the X=1 column
> into the wrong XP: X=1,Y=0 devices are attributed to XP (0,1), and
> X=1,Y=1 devices to an index past the end of the XP array. Their PMU
> events end up programmed into another XP's DTM, with the port/device
> select of the intended XP, so the counters silently read zero while
> the rest of the mesh works.
> 
> Observed on a CI-700 r3 with a 2x2 mesh (part 0x43a), where the SBSX
> and HN-D nodes on the X=1 column never counted although the XP flit
> counters showed the traffic. Forcing a minimum of 2 coordinate bits
> matches the documented node ID format and makes all nodes count;
> the minimum had been there until the node ID refactor dropped it.

Oof, I guess it had slipped my mind that 2x2 configs are legal, but then 
come to think of it, for CI-700 I think 2x1 and 1x2 aren't illegal 
either. As far as I can remember there wasn't any reason for dropping 
the "| 2" term other than thinking it was a simplification we could get 
away with. Oops :(

FWIW I also can't see that it matters to go back to reporting 2 bits 
instead of 1 for 1x1 configs, where the "correct" value is arguably 0 
anyway.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: e79634b53e39 ("perf/arm-cmn: Refactor node ID handling. Again.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sylvain Chouleur <schouleur@snap.com>
> ---
>   drivers/perf/arm-cmn.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 68a096c1fe6b..5f369c7a7a35 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -406,7 +406,8 @@ struct arm_cmn_nodeid {
>   
>   static int arm_cmn_xyidbits(const struct arm_cmn *cmn)
>   {
> -	return fls((cmn->mesh_x - 1) | (cmn->mesh_y - 1));
> +	/* Node IDs never use fewer than 2 bits per XP coordinate */
> +	return fls((cmn->mesh_x - 1) | (cmn->mesh_y - 1) | 2);
>   }
>   
>   static struct arm_cmn_nodeid arm_cmn_nid(const struct arm_cmn_node *dn)
> 
> ---
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
> change-id: 20261125-arm-cmn-xyidbits-16076edf28a2
> 
> Best regards,
> --
> Sylvain Chouleur <schouleur@snap.com>
> 
> 


