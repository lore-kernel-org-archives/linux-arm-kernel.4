Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC61B606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H4MccXZQ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=d9jzsKbl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0D5rV4LDcAhDtJrh0J4x1Fo3FNQEer06zKXspgdSqYw=; b=H4MccXZQt3Wxh2QaTSFvxhorv+
	FqxqNrmCKYvJkOTMegC1DIHrJxKT5yo2sazPUphfn4coZGFgqn2WvlWyhPaP+5vNAK0yqblQUi5M4
	MIl2mpqgbu1qAlTBDK1vB9sBp5x1Ei5f8FAUklFsTBM4Rrf+yTdPapxiS9kP7vju/wZ5eXh5XcYtV
	L5vJDYneZNpqLjrUZasClmNKae+XxLVg0AneYcW2WPnYxLWbmnG35iNFxjNdDgfPMtoSTWnxAOjJp
	Ez/t/4CNrx5uHXFHqsFtbvcOfgdyMeOr9Tvh4rNO4/gqKJL5Oht9HqPZ+tCzYR7DUhhcKnruni8lX
	f7LGZP0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYXL-0000000HSZJ-0X6v;
	Sun, 15 Nov 2026 11:36:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYXI-0000000HSYM-1D8x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:36:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34C0C143D;
	Sun, 15 Nov 2026 03:36:36 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7D3F3F632;
	Sun, 15 Nov 2026 03:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794742599; bh=Z5w+PDWtG8RWg9D5f69nuwbyo8DbysjJ678dY4p5bKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9jzsKbl1bSMU1kU+fHYKgnrLlU2hud+iS8+c+E1PgpKaNnEE4VcUXWFoWDxqWVa9
	 CbjZeQaSGEvWpdRA6GMzq3ZlEfNJHs04hjNExfQ/7VFYV83rBy9JVwumEAh5hi0yce
	 7wntHzLdhQd4OtVhY/9+qQf3tWpMUOGkVwSDM8Ks=
Date: Sun, 15 Nov 2026 11:36:28 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com, cristian.marussi@arm.com
Subject: Re: [PATCH v10 01/13] powercap: Add enable disable control-type
Message-ID: <avmZPMOK8ynHMN0I@pluto>
References: <20261103231007.537082-1-philip.radford@arm.com>
 <20261103231007.537082-2-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103231007.537082-2-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_033640_413307_1BE86AFF 
X-CRM114-Status: GOOD (  29.98  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:09:55PM +0000, Philip Radford wrote:
> Add functionality to disable or enable the Powercap control-type by writing
> directly into sys/class/powercap/arm-scmi/enabled.
> 

Hi Philip,

see a some general remarks down below.

> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
> V9->V10
> - changed control-type enable writes to snapshot per-zone state instead of
>   aggregate
> - cancel enable/disable writes if a root child zone is not configurable
> - roll back changed zones on failure
> - changed control-type enable reads to report enabled if any root child zone
>   is enabled
> ---
>  drivers/powercap/arm_scmi_powercap.c | 175 ++++++++++++++++++++++++++-
>  1 file changed, 174 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
> index ab66e9a3b1e2..ba398048bf21 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/arm_scmi_powercap.c
> @@ -33,13 +33,171 @@ struct scmi_powercap_zone {
>  
>  struct scmi_powercap_root {
>  	unsigned int num_zones;
> +	bool enabled;
> +	struct list_head node;
>  	struct scmi_powercap_zone *spzones;
>  	struct list_head *registered_zones;
>  	struct list_head scmi_zones;
>  };
>  
> +static LIST_HEAD(scmi_powercap_roots);
> +static DEFINE_MUTEX(scmi_powercap_roots_lock);
> +
>  static struct powercap_control_type *scmi_top_pcntrl;
>  
> +static bool scmi_powercap_is_control_type_child(const struct scmi_powercap_zone *spz)
> +{
> +	return spz->registered && !spz->invalid &&
> +	       spz->info->parent_id == SCMI_POWERCAP_ROOT_ZONE_ID;

Not sure to remember clearly the logic here, but is it possible for a
zone to be registered and invalid ?
I made some recent changes/fixes but the invariant that registered
implied !invalid seemed to apply before and after my fixes...

> +}
> +
> +static int
> +scmi_powercap_read_root_children_enable_state(struct scmi_powercap_root *pr, bool *mode)
> +{
> +	struct scmi_powercap_zone *spz;
> +	bool enabled;
> +	int i, ret;
> +
> +	*mode = false;
> +
> +	for (i = 0; i < pr->num_zones; i++) {

	for (int i = 0 ...

> +		spz = &pr->spzones[i];
> +
> +		if (!scmi_powercap_is_control_type_child(spz))
> +			continue;
> +
> +		ret = powercap_ops->cap_enable_get(spz->ph, spz->info->id, &enabled);
> +		if (ret)
> +			return ret;
> +
> +		if (enabled) {
> +			*mode = true;
> +			return 0;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +struct scmi_powercap_zone_state {
> +	struct scmi_powercap_zone *spz;
> +	bool prev_enabled;
> +	bool changed;
> +};
> +
> +static int
> +scmi_powercap_control_type_set_enable(struct powercap_control_type *pct, bool mode)
> +{
> +	struct scmi_powercap_zone_state *states;
> +	struct scmi_powercap_root *pr;
> +	struct scmi_powercap_zone *spz;
> +	int num_zones = 0, nr_states = 0;
> +	int i, ret = 0;

... while looking at some other previous Sashiko reported powercap issue
I had a superficial look at this, and beside the logic that seems to be
fine by itself, the code layout is deadly unreadable, thing which is
pretty normal to happen when there is a mix of allocations mutexes and
various error exit path....please refactor using cleanup handlers to
manage all of this allocations and mutexes, it should allow you to drop
all the gotos and keep a more linear logic across all of this fucntion..
(and NOTE that when using cleanup.h you MUST drop all of the gotos in
this function...all info inside cleanup.h too)
 
> +
> +	mutex_lock(&scmi_powercap_roots_lock);
> +	list_for_each_entry(pr, &scmi_powercap_roots, node) {
> +		for (i = 0; i < pr->num_zones; i++) {
> +			spz = &pr->spzones[i];
> +
> +			if (scmi_powercap_is_control_type_child(spz))
> +				num_zones++;
> +		}
> +	}
> +
> +	states = kcalloc(num_zones, sizeof(*states), GFP_KERNEL);
> +	if (!states) {
> +		ret = -ENOMEM;
> +		goto out_unlock;
> +	}
> +
> +	list_for_each_entry(pr, &scmi_powercap_roots, node)	{
> +		for (i = 0; i < pr->num_zones; i++) {
> +			spz = &pr->spzones[i];
> +
> +			if (!scmi_powercap_is_control_type_child(spz))
> +				continue;
> +
> +			if (!spz->info->powercap_cap_config) {
> +				ret = -EOPNOTSUPP;
> +				goto out_free;
> +			}
> +
> +			states[nr_states].spz = spz;
> +
> +			ret = powercap_ops->cap_enable_get(spz->ph, spz->info->id,
> +				&states[nr_states].prev_enabled);

also...I have not checked this myself, BUT do you use checkpatch --strict that I
can see a few strange indents...

> +
> +			if (ret)
> +				goto out_free;
> +
> +			nr_states++;
> +		}
> +	}
> +
> +	for (i = 0; i < nr_states; i++) {
> +		spz = states[i].spz;
> +
> +		if (states[i].prev_enabled == mode)
> +			continue;
> +
> +		ret = powercap_ops->cap_enable_set(spz->ph, spz->info->id, mode);
> +		if (ret)
> +			goto revert;
> +
> +		states[i].changed = true;
> +	}
> +
> +	goto out_free;
> +
> +revert:
> +	while (i--) {
> +		spz = states[i].spz;
> +
> +		if (!states[i].changed)
> +			continue;
> +
> +		powercap_ops->cap_enable_set(spz->ph, spz->info->id,
> +			states[i].prev_enabled);

ditto...checkpatch

> +	}
> +
> +out_free:
> +			kfree(states);
> +
ditto...checkpatch
> +out_unlock:
> +			mutex_unlock(&scmi_powercap_roots_lock);
ditto...checkpatch
> +
> +			return ret;
> +}
> +
> +static int
> +scmi_powercap_control_type_get_enable(struct powercap_control_type *pct, bool *mode)
> +{
> +	struct scmi_powercap_root *pr;
> +	int ret = 0;
> +

same here...even if it is a smaller function using cleanup guard helps
streamlining the code...

> +	*mode = false;
> +
> +	mutex_lock(&scmi_powercap_roots_lock);
> +	list_for_each_entry(pr, &scmi_powercap_roots, node) {
> +		ret = scmi_powercap_read_root_children_enable_state(pr, &pr->enabled);
> +
> +		if (ret)
> +			break;
> +		if (pr->enabled) {
> +			*mode = true;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&scmi_powercap_roots_lock);
> +
> +	return ret;
> +}
> +

Thanks,
Cristian

