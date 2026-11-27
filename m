Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CB3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n21apHrB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2HuUT3C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OCgPSJCtkLPChPlH/cIJkEpJiXlfTFmVvAKhTHQJgqY=; b=n21apHrBl62/qaPHZBWs81Cocr
	8KvXRDgkR1RIFueUDAs8r3xuo5z230rQRs8tXimWaV6NRVw62zVleQO8vYm5XxuTeKn4ws6uEhRFH
	K4aTwf0WR0TcC1Fi6/d0l3hcLklgBww6Ti4auhLijDq3QQ7qMqkGRjp7WSVCuA2m5xkiApoQIZS6l
	0lUtNEu42+MfwDFYigfaLuA9MCl/EYlt49rkg1XOCkBEmzA7cI3lngR7POdwSAyqoKQi1NhCb34SU
	S9rmqOb/mgsYMarjwgNZ5+xcHDwLvFkr5f4Sb/SniAhOb0DFAmyRgubKLIZil4do59eonDVPfCwb5
	/LPus4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxMO-0000000Gf3M-0hXm;
	Fri, 27 Nov 2026 14:55:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxMJ-0000000Gf1w-3gpx;
	Fri, 27 Nov 2026 14:55:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5287C61949;
	Fri, 27 Nov 2026 14:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E0D1F00897;
	Fri, 27 Nov 2026 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791330;
	bh=OCgPSJCtkLPChPlH/cIJkEpJiXlfTFmVvAKhTHQJgqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L2HuUT3CnX4MStpcPpQ63AT0KBYYiJG7/NYaFsRI3bhFagI04jjiFnLu/VYq8UTRi
	 uoNN3e6RenM1WsnofSDUx01FAGpjUIKfbacGa5nXuagjz021FD5JhVR5ppYbsXHA4H
	 VSAf7F/i2KkKx5JFJEZJCjQwb5qCELRZ962+zcu8us5WvREd8SQGdO7oJtX30REAM0
	 P/bMz8A9SZG5Wvld8OEq/C9hV+hBm0vg9D/ZP3S8fbsIoUy1qpSnNqNcI6+Y5UfXUn
	 MBL3uzcaQWs2o4ld71RN0uQaLGkjp/4HquuzyQycPlSVwI6i9WsDyb4rz1RAB53I6H
	 ceU1F21fIlVCw==
Date: Fri, 27 Nov 2026 14:55:25 +0000
From: Lee Jones <lee@kernel.org>
To: aiyengar1990@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] mfd: syscon: Give each syscon its own lockdep class
Message-ID: <20261127145525.GV38590@joneslee-macbookpro.roam.internal>
References: <20261122-syscon-lockdep-v2-1-868056a6a808@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-syscon-lockdep-v2-1-868056a6a808@gmail.com>
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

On Sun, 22 Nov 2026, Arun Iyengar via B4 Relay wrote:

> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> All syscon regmaps share one lockdep class, as regmap_init_mmio() uses a
> static key per call site. Lockdep then mixes up unrelated syscons: on
> RK3588 the clock-gated VO1 GRF calls clk_enable() under its regmap lock,
> while the CRU's GRF gates take the SYS GRF regmap lock under enable_lock.
> This is reported as a circular dependency and disables lockdep.

This needs fixing in Regmap, not Syscon!

Have you looked into __regmap_lockdep_wrapper()?

Or perhaps 'struct regmap_config' could take an optional 'lock_key'?

> Lock each syscon regmap with its own spinlock and lockdep class.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Tested on an Orange Pi 5 (RK3588S) with a 7.3 based kernel that has
> out-of-tree DisplayPort patches, lockdep and KASAN on. Without the patch
> lockdep reports the cycle during boot. With it /proc/lockdep shows one
> syscon lock -> enable_lock and enable_lock -> another syscon lock, there
> is no report and lockdep stays on. Build-tested on for-mfd-next.
> 
> Applies on top of "mfd: syscon: Put the clock after regmap_exit()":
> https://lore.kernel.org/r/20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com
> 
> Developed with Claude (Anthropic), which wrote the code and the commit
> message. I reviewed every change.
> ---
> Changes in v2:
> - __acquires/__releases: name the argument, not a local (Sashiko).
> - Link to v1: https://patch.msgid.link/20261120-syscon-lockdep-v1-1-aed779a004b8@gmail.com
> ---
>  drivers/mfd/syscon.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 3ff4e024542b..480ac178968a 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/hwspinlock.h>
>  #include <linux/list.h>
> +#include <linux/lockdep.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -20,6 +21,7 @@
>  #include <linux/reset.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  
>  static DEFINE_MUTEX(syscon_list_lock);
>  static LIST_HEAD(syscon_list);
> @@ -29,8 +31,29 @@ struct syscon {
>  	struct regmap *regmap;
>  	struct reset_control *reset;
>  	struct list_head list;
> +	spinlock_t lock;
> +	unsigned long lock_flags;
> +	struct lock_class_key lock_key;
>  };
>  
> +static void syscon_lock(void *arg)
> +__acquires(&((struct syscon *)arg)->lock)
> +{
> +	struct syscon *syscon = arg;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&syscon->lock, flags);
> +	syscon->lock_flags = flags;
> +}
> +
> +static void syscon_unlock(void *arg)
> +__releases(&((struct syscon *)arg)->lock)
> +{
> +	struct syscon *syscon = arg;
> +
> +	spin_unlock_irqrestore(&syscon->lock, syscon->lock_flags);
> +}
> +
>  static const struct regmap_config syscon_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
> @@ -114,12 +137,21 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
>  	if (!syscon_config.max_register)
>  		syscon_config.max_register_is_0 = true;
>  
> +	lockdep_register_key(&syscon->lock_key);
> +	spin_lock_init(&syscon->lock);
> +	lockdep_set_class(&syscon->lock, &syscon->lock_key);
> +	if (!syscon_config.use_hwlock) {
> +		syscon_config.lock = syscon_lock;
> +		syscon_config.unlock = syscon_unlock;
> +		syscon_config.lock_arg = syscon;
> +	}

Duplicating regmap's internal spinlock callbacks here just to give each syscon
its own 'lock_class_key' feels like working around regmap in the wrong layer.
Could we either pass a per-syscon key into __regmap_init_mmio_clk() or add an
optional 'lock_key' to 'struct regmap_config' so regmap core handles the lockdep
class directly without open-coding syscon_lock() and syscon_unlock() here?

> +
>  	regmap = regmap_init_mmio(NULL, base, &syscon_config);
>  	kfree(syscon_config.name);
>  	if (IS_ERR(regmap)) {
>  		pr_err("regmap init failed\n");
>  		ret = PTR_ERR(regmap);
> -		goto err_regmap;
> +		goto err_key;
>  	}
>  
>  	if (check_res) {
> @@ -159,6 +191,8 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
>  	regmap_exit(regmap);
>  	if (!IS_ERR(clk))
>  		clk_put(clk);
> +err_key:
> +	lockdep_unregister_key(&syscon->lock_key);
>  err_regmap:
>  	iounmap(base);
>  	return ERR_PTR(ret);
> 
> ---
> base-commit: 1cb7268b6638c411fc32f373e965eb8ba9e9b2b4
> change-id: 20261115-syscon-lockdep-d133fb58c2be
> prerequisite-message-id: <20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com>
> prerequisite-patch-id: 7cf33abeabb3eeaf1ba8ac6c461726fca87702cd
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>
> 
> 

-- 
Lee Jones

